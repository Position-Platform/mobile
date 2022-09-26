import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/core/utils/functions.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/categories_model.dart';
import 'package:position/src/modules/map/submodules/categories/repositories/categoriesRepository.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissement.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissements_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/repository/etablissementRepository.dart';
import 'package:position/src/modules/map/submodules/nominatim/models/nominatim.dart';
import 'package:position/src/modules/map/submodules/nominatim/repository/nominatimRepository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  NominatimRepository? nominatimRepository;
  EtablissementRepository? etablissementRepository;
  CategoriesRepository? categoriesRepository;
  SearchBloc(
      {this.nominatimRepository,
      this.etablissementRepository,
      this.categoriesRepository})
      : super(SearchInitial()) {
    on<MakeSearch>(_search);
  }

  void _search(
    MakeSearch event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());

    try {
      var nominatimResult =
          await nominatimRepository!.searchplace(event.query!);
      var etablissementsResult = await etablissementRepository!
          .searchetablissements(event.query!, event.user!.id!);
      var categoriesResult =
          await categoriesRepository!.searchcategories(event.query!);
      List<SearchModel> searchResults = [
        ...await _getEtablissementFromResponse(etablissementsResult.success!),
        ..._getCategorieFromResponse(categoriesResult.success!),
        ...await _getNominatimFromResponse(nominatimResult.success!)
      ];

      emit(SearchLoaded(searchResults));
    } catch (e) {
      emit(SearchError());
    }
  }

  Future<List<SearchModel>> _getNominatimFromResponse(
      NominatimModel nominatimModel) async {
    return [
      for (var i = 0; i < nominatimModel.features!.length; i++)
        SearchModel(
            name: nominatimModel.features![i].properties!.displayName,
            details: nominatimModel.features![i].properties!.address!.country,
            type: "nominatim",
            id: nominatimModel.features![i].properties!.osmId.toString(),
            longitude: nominatimModel.features![i].geometry!.coordinates![0]
                .toString(),
            latitude: nominatimModel.features![i].geometry!.coordinates![1]
                .toString(),
            logo: nominatimModel.features![i].properties!.icon ??
                "$apiUrl/images/icon-icon-position-pin.png",
            logomap: "$apiUrl/images/icon-icon-position-pin.png",
            features: nominatimModel.features![i],
            distance: await calculateDistance(
                nominatimModel.features![i].geometry!.coordinates![0]
                    .toString(),
                nominatimModel.features![i].geometry!.coordinates![1]
                    .toString()))
    ];
  }

  Future<List<SearchModel>> _getEtablissementFromResponse(
      EtablissementsModel etablissementsModel) async {
    return [
      for (var i = 0; i < etablissementsModel.data!.etablissements!.length; i++)
        SearchModel(
            name: etablissementsModel.data!.etablissements![i].nom,
            details: etablissementsModel
                .data!.etablissements![i].sousCategories![0].nom,
            type: "etablissement",
            id: etablissementsModel.data!.etablissements![i].id.toString(),
            longitude: etablissementsModel
                .data!.etablissements![i].batiment!.longitude,
            latitude:
                etablissementsModel.data!.etablissements![i].batiment!.latitude,
            logo: etablissementsModel.data!.etablissements![i].logo ??
                etablissementsModel
                    .data!.etablissements![i].sousCategories![0].logourl ??
                etablissementsModel.data!.etablissements![i].sousCategories![0]
                    .category!.logourl,
            logomap: etablissementsModel.data!.etablissements![i].logoMap ??
                etablissementsModel
                    .data!.etablissements![i].sousCategories![0].logourlmap ??
                etablissementsModel.data!.etablissements![i].sousCategories![0]
                    .category!.logourlmap,
            etablissement: etablissementsModel.data!.etablissements![i],
            isOpenNow: etablissementsModel.data!.etablissements![i].isopen,
            plageDay: _checkIfEtablissementIsOpen(
                etablissementsModel.data!.etablissements![i]),
            distance: await calculateDistance(
                etablissementsModel
                    .data!.etablissements![i].batiment!.longitude!,
                etablissementsModel
                    .data!.etablissements![i].batiment!.latitude!))
    ];
  }

  List<SearchModel> _getCategorieFromResponse(CategoriesModel categoriesModel) {
    return [
      for (var i = 0; i < categoriesModel.data!.categories!.length; i++)
        SearchModel(
            name: categoriesModel.data!.categories![i].nom,
            details: "categorie",
            type: "categorie",
            id: categoriesModel.data!.categories![i].id.toString(),
            logo: apiUrl + categoriesModel.data!.categories![i].logourl!,
            logomap: apiUrl + categoriesModel.data!.categories![i].logourlmap!,
            category: categoriesModel.data!.categories![i])
    ];
  }

  String _checkIfEtablissementIsOpen(Etablissement etablissement) {
    var now = DateTime.now().weekday;
    String plage = "";

    for (var i = 0; i < etablissement.horaires!.length; i++) {
      if (etablissement.horaires![i].jour == "lundi" && now == 1) {
        plage = etablissement.horaires![i].plageHoraire!;
      } else if (etablissement.horaires![i].jour == "mardi" && now == 2) {
        plage = etablissement.horaires![i].plageHoraire!;
      } else if (etablissement.horaires![i].jour == "mercredi" && now == 3) {
        plage = etablissement.horaires![i].plageHoraire!;
      } else if (etablissement.horaires![i].jour == "jeudi" && now == 4) {
        plage = etablissement.horaires![i].plageHoraire!;
      } else if (etablissement.horaires![i].jour == "vendredi" && now == 5) {
        plage = etablissement.horaires![i].plageHoraire!;
      } else if (etablissement.horaires![i].jour == "samedi" && now == 6) {
        plage = etablissement.horaires![i].plageHoraire!;
      } else if (etablissement.horaires![i].jour == "dimanche" && now == 7) {
        plage = etablissement.horaires![i].plageHoraire!;
      }
    }

    return plage;
  }
}

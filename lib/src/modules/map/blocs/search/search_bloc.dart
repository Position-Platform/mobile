import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/core/utils/functions.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/categories/repositories/categoriesRepository.dart';
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

      for (var i = 0; i < nominatimResult.success!.features!.length; i++) {
        nominatimResult.success!.features![i].distance =
            await calculateDistance(
          nominatimResult.success!.features![i].geometry!.coordinates![0]
              .toString(),
          nominatimResult.success!.features![i].geometry!.coordinates![1]
              .toString(),
        );
      }

      nominatimResult.success!.features!
          .sort((a, b) => a.distance!.compareTo(b.distance!));

      var etablissementsResult = await etablissementRepository!
          .searchetablissements(event.query!, event.user!.id!);
      for (var j = 0;
          j < etablissementsResult.success!.data!.etablissements!.data!.length;
          j++) {
        etablissementsResult.success!.data!.etablissements!.data![j].distance =
            await calculateDistance(
                etablissementsResult
                    .success!.data!.etablissements!.data![j].batiment!.longitude
                    .toString(),
                etablissementsResult
                    .success!.data!.etablissements!.data![j].batiment!.latitude
                    .toString());
      }
      etablissementsResult.success!.data!.etablissements!.data!
          .sort((a, b) => a.distance!.compareTo(b.distance!));
      /*  var categoriesResult =
          await categoriesRepository!.searchcategories(event.query!);*/
      List<SearchModel> searchResults = [
        ...await _getEtablissementFromResponse(etablissementsResult.success!),
        // ..._getCategorieFromResponse(categoriesResult.success!),
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
      for (var i = 0;
          i < etablissementsModel.data!.etablissements!.data!.length;
          i++)
        SearchModel(
            name: etablissementsModel.data!.etablissements!.data![i].nom,
            details:
                "${etablissementsModel.data!.etablissements!.data![i].sousCategories![0].nom!} , ${etablissementsModel.data!.etablissements!.data![i].batiment!.ville!}",
            type: "etablissement",
            id: etablissementsModel.data!.etablissements!.data![i].id
                .toString(),
            longitude: etablissementsModel
                .data!.etablissements!.data![i].batiment!.longitude,
            latitude: etablissementsModel
                .data!.etablissements!.data![i].batiment!.latitude,
            logo: etablissementsModel.data!.etablissements!.data![i].logo ??
                etablissementsModel.data!.etablissements!.data![i]
                    .sousCategories![0].logourl ??
                etablissementsModel.data!.etablissements!.data![i]
                    .sousCategories![0].category!.logourl,
            logomap: etablissementsModel
                    .data!.etablissements!.data![i].logoMap ??
                etablissementsModel.data!.etablissements!.data![i]
                    .sousCategories![0].logourlmap ??
                etablissementsModel.data!.etablissements!.data![i]
                    .sousCategories![0].category!.logourlmap,
            etablissement: etablissementsModel.data!.etablissements!.data![i],
            isOpenNow:
                etablissementsModel.data!.etablissements!.data![i].isopen,
            plageDay: checkIfEtablissementIsOpen(
                etablissementsModel.data!.etablissements!.data![i]),
            distance: await calculateDistance(
                etablissementsModel
                    .data!.etablissements!.data![i].batiment!.longitude!,
                etablissementsModel
                    .data!.etablissements!.data![i].batiment!.latitude!))
    ];
  }

  /* List<SearchModel> _getCategorieFromResponse(CategoriesModel categoriesModel) {
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
  }*/
}

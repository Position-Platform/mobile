import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:position/src/core/database/db.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/core/utils/functions.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/categories/repositories/categoriesRepository.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissements_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/repository/etablissementRepository.dart';
import 'package:position/src/modules/map/submodules/nominatim/models/nominatim.dart';
import 'package:position/src/modules/map/submodules/nominatim/repository/nominatimRepository.dart';
import 'package:position/src/modules/map/submodules/search/db/search.dao.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  NominatimRepository? nominatimRepository;
  EtablissementRepository? etablissementRepository;
  CategoriesRepository? categoriesRepository;
  SearchDao? searchDao;
  SearchBloc(
      {this.nominatimRepository,
      this.etablissementRepository,
      this.categoriesRepository,
      this.searchDao})
      : super(SearchInitial()) {
    on<MakeSearch>(_search);
    on<AddSuggestion>(_addSuggestion);
    on<GetSuggestions>(_getSuggestions);
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
        double distance = await calculateDistance(
            etablissementsResult
                .success!.data!.etablissements!.data![j].batiment!.longitude
                .toString(),
            etablissementsResult
                .success!.data!.etablissements!.data![j].batiment!.latitude
                .toString());
        etablissementsResult.success!.data!.etablissements!.data![j].distance =
            distance.toString();
      }
      etablissementsResult.success!.data!.etablissements!.data!
          .sort((a, b) => a.distance!.compareTo(b.distance!));

      var categoriesResult =
          await categoriesRepository!.searchcategories(event.query!);
      List<SearchModel> searchResults = [
        ..._getCategorieFromResponse(categoriesResult.success!),
        ...await _getEtablissementFromResponse(etablissementsResult.success!),
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
            distance: nominatimModel.features![i].distance)
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
            distance: double.parse(
                etablissementsModel.data!.etablissements!.data![i].distance!))
    ];
  }

  List<SearchModel> _getCategorieFromResponse(List<Category> categories) {
    return [
      for (var i = 0; i < categories.length; i++)
        SearchModel(
            name: categories[i].nom,
            details: "categorie",
            type: "categorie",
            id: categories[i].id.toString(),
            logo: apiUrl + categories[i].logourl!,
            logomap: apiUrl + categories[i].logourlmap!,
            category: categories[i])
    ];
  }

  _addSuggestion(
    AddSuggestion event,
    Emitter<SearchState> emit,
  ) async {
    List<SearchTableData> searchTable = await searchDao!.allSuggestions;
    List<SearchModel> suggestions = [];

    for (var i = 0; i < searchTable.length; i++) {
      suggestions.add(searchTable[i].suggestion!);
    }

    try {
      await searchDao!.addSuggestion(SearchTableCompanion(
          id: Value(int.parse(event.matchQuery!.id!)),
          suggestion: Value(event.matchQuery!)));

      emit(SuggestionAdded(event.matchQuery));
    } catch (e) {
      emit(SuggestionError());
    }

    if (!suggestions.contains(event.matchQuery)) {}
  }

  _getSuggestions(
    GetSuggestions event,
    Emitter<SearchState> emit,
  ) async {
    List<SearchTableData> searchTable = await searchDao!.allSuggestions;
    List<SearchModel> suggestions = [];

    for (var i = 0; i < searchTable.length; i++) {
      suggestions.add(searchTable[i].suggestion!);
    }

    emit(ListSuggestions(suggestions));
  }
}

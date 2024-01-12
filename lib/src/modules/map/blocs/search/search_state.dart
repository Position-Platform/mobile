part of 'search_bloc.dart'; // Importation de la partie du fichier contenant la classe SearchBloc

abstract class SearchState extends Equatable {
  // Définition de la classe abstraite SearchState qui étend Equatable
  const SearchState(); // Constructeur par défaut

  @override
  List<Object> get props =>
      []; // Implémentation de la méthode props qui renvoie une liste vide
}

class SearchInitial
    extends SearchState {} // Définition de la classe SearchInitial qui représente l'état initial du bloc de recherche

class SearchLoading
    extends SearchState {} // Définition de la classe SearchLoading qui représente l'état de chargement du bloc de recherche

class SearchLoaded extends SearchState {
  // Définition de la classe SearchLoaded qui représente l'état de chargement réussi du bloc de recherche
  final List<SearchModel>?
      searchresult; // Champ searchresult qui est une liste d'objets SearchModel

  const SearchLoaded(
      this.searchresult); // Constructeur qui prend une liste d'objets SearchModel en argument

  @override
  List<Object> get props => [
        searchresult!
      ]; // Implémentation de la méthode props qui renvoie une liste contenant searchresult

  @override
  String toString() =>
      'SearchLoaded { Search Result: $searchresult }'; // Implémentation de la méthode toString qui renvoie une chaîne de caractères représentant l'état de l'objet SearchLoaded
}

class SearchError
    extends SearchState {} // Définition de la classe SearchError qui représente l'état d'erreur du bloc de recherche

class SuggestionAdded extends SearchState {
  // Définition de la classe SuggestionAdded qui représente l'ajout d'une suggestion de recherche au bloc de recherche
  final SearchModel?
      matchQuery; // Champ matchQuery qui est un objet SearchModel

  const SuggestionAdded(
      this.matchQuery); // Constructeur qui prend un objet SearchModel en argument

  @override
  List<Object> get props => [
        matchQuery!
      ]; // Implémentation de la méthode props qui renvoie une liste contenant matchQuery

  @override
  String toString() =>
      'SuggestionAdded { MatchQuery: $matchQuery }'; // Implémentation de la méthode toString qui renvoie une chaîne de caractères représentant l'état de l'objet SuggestionAdded
}

class ListSuggestions extends SearchState {
  // Définition de la classe ListSuggestions qui représente une liste de suggestions de recherche
  final List<SearchModel>?
      suggestions; // Champ suggestions qui est une liste d'objets SearchModel

  const ListSuggestions(
      this.suggestions); // Constructeur qui prend une liste d'objets SearchModel en argument

  @override
  List<Object> get props => [
        suggestions!
      ]; // Implémentation de la méthode props qui renvoie une liste contenant suggestions

  @override
  String toString() =>
      'ListSuggestions { Suggestions: $suggestions }'; // Implémentation de la méthode toString qui renvoie une chaîne de caractères représentant l'état de l'objet ListSuggestions
}

class SuggestionError
    extends SearchState {} // Définition de la classe SuggestionError qui représente une erreur lors de la récupération des suggestions de recherche

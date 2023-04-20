part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class MakeSearch extends SearchEvent {
  final String? query;
  final User? user;

  const MakeSearch(this.query, this.user);

  @override
  List<Object> get props => [query!];

  @override
  String toString() => 'MakeSearch { Query: $query }';
}

class AddSuggestion extends SearchEvent {
  final String? matchQuery;

  const AddSuggestion(this.matchQuery);

  @override
  List<Object> get props => [matchQuery!];

  @override
  String toString() => 'AddSuggestion { MatchQuery: $matchQuery }';
}

class GetSuggestions extends SearchEvent {}

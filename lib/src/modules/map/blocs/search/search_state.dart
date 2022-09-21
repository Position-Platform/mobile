part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<SearchModel>? searchresult;

  const SearchLoaded(this.searchresult);

  @override
  List<Object> get props => [searchresult!];

  @override
  String toString() => 'SearchLoaded { Search Result: $searchresult }';
}

class SearchError extends SearchState {}

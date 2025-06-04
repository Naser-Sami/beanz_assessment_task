part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoaded extends SearchState {
  final News news;
  SearchLoaded(this.news);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}

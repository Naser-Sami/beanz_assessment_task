part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchQueryChanged extends SearchEvent {
  final EverythingQueryParameters query;
  SearchQueryChanged(this.query);
}

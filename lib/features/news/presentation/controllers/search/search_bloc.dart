import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '/features/_features.dart'
    show EverythingQueryParameters, News, GetSearchedNewsUseCase;

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchedNewsUseCase getSearchedNewsUseCase;

  SearchBloc(this.getSearchedNewsUseCase) : super(SearchInitial()) {
    on<SearchQueryChanged>(
      _onSearchQueryChanged,
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query.q.trim();
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    // emit(SearchLoading());
    final result = await getSearchedNewsUseCase(
      EverythingQueryParameters(q: query),
    );

    result.fold(
      (failure) => emit(SearchError(failure.error)),
      (news) => emit(SearchLoaded(news)),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}

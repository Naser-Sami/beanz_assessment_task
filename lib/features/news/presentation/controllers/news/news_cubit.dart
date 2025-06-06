import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/_features.dart'
    show News, TopHeadlinesQueryParameters, GetTopHeadlinesNewsUseCase;

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final GetTopHeadlinesNewsUseCase getTopHeadlinesNewsUseCase;
  NewsCubit(this.getTopHeadlinesNewsUseCase) : super(NewsInitial());

  Future<void> loadPage({
    required int page,
    TopHeadlinesQueryParameters? baseParams,
    bool append = false,
  }) async {
    final previousState = state;

    if (previousState is NewsLoaded && append) {
      emit(NewsLoadingMore(previousState.news));
    } else {
      emit(NewsLoading());
    }

    final params = baseParams?.copyWith(page: page);
    final result = await getTopHeadlinesNewsUseCase(
      params ?? TopHeadlinesQueryParameters(),
    );

    result.fold((failure) => emit(NewsError(failure.error)), (newNews) {
      final totalPages = (newNews.totalResults / (params?.pageSize ?? 10))
          .ceil();

      if (previousState is NewsLoaded && append) {
        final currentNews = previousState.news;
        final combinedArticles = [...currentNews.articles, ...newNews.articles];
        final merged = currentNews.copyWith(articles: combinedArticles);
        emit(NewsLoaded(merged, currentPage: page, totalPages: totalPages));
      } else {
        emit(NewsLoaded(newNews, currentPage: page, totalPages: totalPages));
      }
    });
  }
}

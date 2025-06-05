import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '/features/_features.dart'
    show
        News,
        NewsMapper,
        NewsModel,
        TopHeadlinesQueryParameters,
        GetTopHeadlinesNewsUseCase;

part 'news_state.dart';

class NewsCubit extends HydratedCubit<NewsState> {
  final GetTopHeadlinesNewsUseCase getTopHeadlinesNewsUseCase;
  NewsCubit(this.getTopHeadlinesNewsUseCase) : super(NewsInitial());

  int totalPages = 0;

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
      totalPages = (newNews.totalResults / (params?.pageSize ?? 10)).ceil();

      if (previousState is NewsLoaded && append) {
        final currentNews = previousState.news;
        final combinedArticles = [...currentNews.articles, ...newNews.articles];
        final merged = currentNews.copyWith(articles: combinedArticles);
        emit(NewsLoaded(merged, currentPage: page));
      } else {
        emit(NewsLoaded(newNews, currentPage: page));
      }
    });
  }

  @override
  Map<String, dynamic>? toJson(NewsState state) {
    if (state is NewsLoaded) {
      final newsModel = NewsMapper.fromDomain(state.news);
      return {
        'news': newsModel.toJson(),
        'timestamp': state.timestamp.toIso8601String(),
      };
    }
    return null;
  }

  @override
  NewsState? fromJson(Map<String, dynamic> json) {
    try {
      final newsModel = NewsModel.fromJson(json['news']);
      final newsEntity = NewsMapper.toDomain(newsModel);
      final timestamp = DateTime.parse(json['timestamp']);
      return NewsLoaded(newsEntity, timestamp: timestamp);
    } catch (_) {
      return null;
    }
  }
}

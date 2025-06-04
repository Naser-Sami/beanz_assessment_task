import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '/features/_features.dart'
    show
        News,
        NewsMapper,
        NewsModel,
        Article,
        TopHeadlinesQueryParameters,
        GetTopHeadlinesNewsUseCase;

part 'news_state.dart';

class NewsCubit extends HydratedCubit<NewsState> {
  final GetTopHeadlinesNewsUseCase getTopHeadlinesNewsUseCase;
  NewsCubit(this.getTopHeadlinesNewsUseCase) : super(NewsInitial());

  Future<void> getTopHeadlinesNews(
    TopHeadlinesQueryParameters queryParameters,
  ) async {
    if (state is NewsLoaded) {
      final loadedState = state as NewsLoaded;
      final isExpired =
          DateTime.now().difference(loadedState.timestamp).inMinutes > 5;
      if (!isExpired) {
        // Use cached data
        return;
      }
    }

    emit(NewsLoading());
    final result = await getTopHeadlinesNewsUseCase(queryParameters);

    result.fold(
      (failure) => emit(NewsError(failure.error)),
      (news) => emit(NewsLoaded(news)),
    );
  }

  Article findArticleById(String id) {
    if (state is NewsLoaded) {
      final news = (state as NewsLoaded).news;
      try {
        return news.articles.firstWhere((article) => article.uuid == id);
      } catch (_) {
        return Article.empty;
      }
    }

    return Article.empty;
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

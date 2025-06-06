part of 'news_cubit.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final News news;
  final int currentPage;
  final int totalPages;

  const NewsLoaded(this.news, {this.currentPage = 1, this.totalPages = 0});

  NewsLoaded copyWith({News? news, int? currentPage, int? totalPages}) {
    return NewsLoaded(
      news ?? this.news,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object> get props => [news, currentPage, totalPages];
}

class NewsLoadingMore extends NewsState {
  final News news;
  const NewsLoadingMore(this.news);

  @override
  List<Object> get props => [news];
}

final class NewsError extends NewsState {
  final String error;
  const NewsError(this.error);

  @override
  List<Object> get props => [error];
}

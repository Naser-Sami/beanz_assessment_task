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
  final DateTime timestamp;

  NewsLoaded(this.news, {DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();

  @override
  List<Object> get props => [news, timestamp];
}

final class NewsError extends NewsState {
  final String error;
  const NewsError(this.error);

  @override
  List<Object> get props => [error];
}

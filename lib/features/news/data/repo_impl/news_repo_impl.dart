import 'package:dartz/dartz.dart';

import '/core/_core.dart' show Failure;
import '/features/_features.dart'
    show
        INewsRepository,
        IRemoteDataSource,
        News,
        TopHeadlinesQueryParameters,
        EverythingQueryParameters,
        NewsMapper;

class NewsRepository implements INewsRepository {
  final IRemoteDataSource remoteDataSource;
  NewsRepository(this.remoteDataSource);

  @override
  Future<Either<Failure<String>, News>> getTopHeadlinesNews(
    TopHeadlinesQueryParameters queryParameters,
  ) async {
    try {
      final newModel = await remoteDataSource.getTopHeadlinesNews(
        queryParameters,
      );

      final response = NewsMapper.toDomain(newModel);
      return right(response);
    } catch (e) {
      return left(const Failure(error: 'Failed to get news'));
    }
  }

  @override
  Future<Either<Failure<String>, News>> getSearchedNews(
    EverythingQueryParameters queryParameters,
  ) async {
    try {
      final newModel = await remoteDataSource.getSearchedNews(queryParameters);

      final response = NewsMapper.toDomain(newModel);
      return right(response);
    } catch (e) {
      return left(const Failure(error: 'Failed to get searched news'));
    }
  }
}

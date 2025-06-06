import 'package:dartz/dartz.dart';

import '/core/_core.dart' show Failure;
import '/features/_features.dart'
    show
        INewsRepository,
        IRemoteDataSource,
        INewsLocalDataSource,
        News,
        TopHeadlinesQueryParameters,
        EverythingQueryParameters,
        NewsMapper;

class NewsRepository implements INewsRepository {
  final IRemoteDataSource remoteDataSource;
  final INewsLocalDataSource localDataSource;

  NewsRepository(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure<String>, News>> getTopHeadlinesNews(
    TopHeadlinesQueryParameters params,
  ) async {
    try {
      // First check cache
      final cached = localDataSource.getCachedNews(params.page);
      if (cached != null) {
        await localDataSource.cleanExpired();
        return Right(cached);
      }

      // Fetch from remote
      final newsModel = await remoteDataSource.getTopHeadlinesNews(params);

      final news = NewsMapper.toDomain(newsModel);

      // Cache result
      await localDataSource.cacheNews(news, params.page);

      return Right(news);
    } catch (e) {
      return const Left(Failure(error: 'Failed to get news'));
    }
  }

  @override
  Future<Either<Failure<String>, News>> getSearchedNews(
    EverythingQueryParameters params,
  ) async {
    try {
      final newModel = await remoteDataSource.getSearchedNews(params);

      final response = NewsMapper.toDomain(newModel);
      return Right(response);
    } catch (e) {
      return const Left(Failure(error: 'Failed to get searched news'));
    }
  }
}

import 'package:dartz/dartz.dart';

import '/core/_core.dart' show BaseUseCase, Failure;
import '/features/_features.dart'
    show INewsRepository, News, TopHeadlinesQueryParameters;

class GetTopHeadlinesNewsUseCase
    extends BaseUseCase<News, TopHeadlinesQueryParameters> {
  final INewsRepository repository;
  GetTopHeadlinesNewsUseCase(this.repository);

  @override
  Future<Either<Failure<String>, News>> call(
    TopHeadlinesQueryParameters p,
  ) async {
    return await repository.getTopHeadlinesNews(p);
  }
}

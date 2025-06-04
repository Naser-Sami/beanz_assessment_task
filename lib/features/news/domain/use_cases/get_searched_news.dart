import 'package:dartz/dartz.dart';

import '/core/_core.dart' show BaseUseCase, Failure;
import '/features/_features.dart'
    show INewsRepository, News, EverythingQueryParameters;

class GetSearchedNewsUseCase
    extends BaseUseCase<News, EverythingQueryParameters> {
  final INewsRepository repository;
  GetSearchedNewsUseCase(this.repository);

  @override
  Future<Either<Failure, News>> call(EverythingQueryParameters p) async {
    return await repository.getSearchedNews(p);
  }
}

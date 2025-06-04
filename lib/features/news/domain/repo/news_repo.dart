import 'package:dartz/dartz.dart';

import '/core/_core.dart' show Failure;
import '/features/_features.dart'
    show News, TopHeadlinesQueryParameters, EverythingQueryParameters;

abstract class INewsRepository {
  Future<Either<Failure<String>, News>> getTopHeadlinesNews(
    TopHeadlinesQueryParameters queryParameters,
  );

  Future<Either<Failure<String>, News>> getSearchedNews(
    EverythingQueryParameters queryParameters,
  );
}

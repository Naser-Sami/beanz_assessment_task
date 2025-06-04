import '/core/_core.dart' show sl, ApiClient, ApiEndpoints;
import '/features/_features.dart'
    show NewsModel, TopHeadlinesQueryParameters, EverythingQueryParameters;

abstract class IRemoteDataSource {
  Future<NewsModel> getTopHeadlinesNews(
    TopHeadlinesQueryParameters queryParameters,
  );
  Future<NewsModel> getSearchedNews(EverythingQueryParameters queryParameters);
}

class RemoteDataSource implements IRemoteDataSource {
  final ApiClient apiClient = sl<ApiClient>();

  @override
  Future<NewsModel> getTopHeadlinesNews(
    TopHeadlinesQueryParameters queryParameters,
  ) async {
    try {
      parser(data) => NewsModel.fromJson(data);

      final response = await apiClient.get<NewsModel>(
        path: ApiEndpoints.topHeadlines,
        parser: parser,
        queryParameters: queryParameters.toMap(),
      );

      if (response == null) {
        throw Exception('Failed to fetch top headlines news');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NewsModel> getSearchedNews(
    EverythingQueryParameters queryParameters,
  ) async {
    try {
      parser(data) => NewsModel.fromJson(data);

      final response = await apiClient.get<NewsModel>(
        path: ApiEndpoints.everything,
        parser: parser,
        queryParameters: queryParameters.toMap(),
      );

      if (response == null) {
        throw Exception('Failed to fetch search data');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }
}

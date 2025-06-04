import '/core/_core.dart' show ApiEndpoints;

class TopHeadlinesQueryParameters {
  final String country;
  final String category;
  final int pageSize;
  final int page;
  final String? apiKey;

  TopHeadlinesQueryParameters({
    this.country = 'us',
    this.category = '',
    this.pageSize = 12,
    this.page = 1,
    this.apiKey,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'category': category,
      'pageSize': pageSize,
      'page': page,
      'apiKey': apiKey ?? ApiEndpoints.apiKey,
    };
  }
}

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
    this.pageSize = 10,
    this.page = 1,
    this.apiKey,
  });

  TopHeadlinesQueryParameters copyWith({
    String? country,
    String? category,
    int? pageSize,
    int? page,
    String? apiKey,
  }) {
    return TopHeadlinesQueryParameters(
      country: country ?? this.country,
      category: category ?? this.category,
      pageSize: pageSize ?? this.pageSize,
      page: page ?? this.page,
      apiKey: apiKey ?? this.apiKey,
    );
  }

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

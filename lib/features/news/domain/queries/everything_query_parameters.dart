import '/core/_core.dart' show ApiEndpoints;

class EverythingQueryParameters {
  final String q;
  final String? from;
  final String sortBy;
  final String? apiKey;

  EverythingQueryParameters({
    required this.q,
    this.from,
    this.sortBy = 'popularity',
    this.apiKey,
  });

  Map<String, dynamic> toMap() {
    return {
      'q': q,
      'from': from,
      'sortBy': sortBy,
      'apiKey': apiKey ?? ApiEndpoints.apiKey,
    };
  }
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://newsapi.org/v2/';
  static final String apiKey = dotenv.env['NEWS_API_KEY'].toString();

  static const String topHeadlines = 'top-headlines';
  static const String everything = 'everything';
  // GET https://newsapi.org/v2/everything?q=Apple&from=2025-06-03&sortBy=popularity&apiKey=API_KEY
}

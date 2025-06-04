import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '_dio_service.dart';

class DioService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
    ),
  );

  DioService() {
    dio.interceptors.add(
      PrettyDioLogger(
        responseBody: false,
        requestHeader: false,
        requestBody: false,
        responseHeader: false,
      ),
    );
  }
}

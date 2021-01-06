import 'package:dio/dio.dart';
import 'config/api.dart';

Map<String, String> headers = {'Accept': 'application/json'};

/// Dio HTTP client, accessible globally with a single [API_BASE_URL]
///
/// @usage dio.get('/api/resources')
/// @return [Dio]
final Dio dio = Dio(
  BaseOptions(
    baseUrl: ApiConfig.getApiBaseUrl(),
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: headers,
  ),
);

import 'package:dio/dio.dart';

// ignore: non_constant_identifier_names
final String API_BASE_URL = 'http://192.168.1.7';

/// Dio HTTP client, accessible globally with a single [API_BASE_URL]
///
/// @usage dio.get('/api/resources')
/// @return [Dio]
final Dio dio = Dio(
  BaseOptions(
    baseUrl: API_BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ),
);

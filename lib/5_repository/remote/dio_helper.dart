import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DioHelper {
  DioHelper._();

  /// 사용 예시
  /// ```dart
  /// final queryParam = <String, dynamic>{};
  /// DioFactory.setQueryParam(queryParam, 'sample', sampleValue);
  ///
  /// final response = await _dio.get(
  ///   '/api-path/sample',
  ///   queryParameters: queryParam,
  /// );
  /// ```
  static setQueryParam(
    Map<String, dynamic> queryParam,
    String key,
    dynamic value,
  ) {
    if (value != null) queryParam[key] = value;
  }

  static final LogInterceptor logInterceptor = LogInterceptor(
    requestBody: true,
    responseBody: true,
    // logPrint: (obj) => Logger().i('$obj'),
    logPrint: (obj) => debugPrint('$obj'),
  );
}

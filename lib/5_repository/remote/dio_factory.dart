import 'package:dio/dio.dart';
import 'package:translation_helper/5_repository/remote/dio_helper.dart';
import 'package:translation_helper/build_config.dart';

class DioFactory {
  static Duration multipartTimeout = const Duration(seconds: 600);

  static Dio getDioClientForPapago(String clientId, String clientSecret) {
    var dio = Dio();
    return dio
      ..options.baseUrl = BuildConfig.naverOpenApiAddress
      ..options.connectTimeout = const Duration(seconds: 10) // 10s
      ..options.receiveTimeout = const Duration(seconds: 10) // 10s
      ..options.headers['Content-Type'] =
          "application/x-www-form-urlencoded; charset=UTF-8"
      ..options.headers['X-Naver-Client-Id'] = clientId
      ..options.headers['X-Naver-Client-Secret'] = clientSecret
      ..interceptors.add(DioHelper.logInterceptor);
  }
}

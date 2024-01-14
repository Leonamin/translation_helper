import 'package:dio/dio.dart';
import 'package:translation_helper/1_data/remote/papago/papago_translation_req.dart';
import 'package:translation_helper/1_data/remote/papago/papago_translation_res.dart';
import 'package:translation_helper/5_repository/remote/dio_factory.dart';
import 'package:translation_helper/build_config.dart';

class ApiPapago {
  ApiPapago._();

  static final ApiPapago _instance = ApiPapago._();

  factory ApiPapago() => _instance;

  final Dio _dio = DioFactory.getDioClientForPapago(
    BuildConfig.naverClientId,
    BuildConfig.naverClientSecret,
  );

  Future<PapagoTranslationRes> requestTranslation(
      PapagoTranslationReq req) async {
    final response = await _dio.post(
      '/papago/n2mt',
      data: req.toMap(),
    );

    return PapagoTranslationRes.fromJson(response.data);
  }
}

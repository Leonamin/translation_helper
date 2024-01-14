import 'package:translation_helper/1_data/0_common/reqeust_result.dart';
import 'package:translation_helper/1_data/model/papago/papago_language_code.dart';
import 'package:translation_helper/1_data/remote/papago/papago_translation_req.dart';
import 'package:translation_helper/5_repository/remote/api_papago.dart';

class PapagoModel {
  final _apiPapago = ApiPapago();

  PapagoModel._();

  static final PapagoModel _instance = PapagoModel._();

  factory PapagoModel() => _instance;

  Future<RequestResult<String>> translateFromKoToEn(String text) =>
      handleRequest(() async {
        final res = await _apiPapago.requestTranslation(
          PapagoTranslationReq(
            source: PapagoLanguageCode.ko,
            target: PapagoLanguageCode.en,
            text: text,
          ),
        );
        return res.message.result.translatedText;
      });
}

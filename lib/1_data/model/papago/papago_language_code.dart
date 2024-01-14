import 'package:json_annotation/json_annotation.dart';

enum PapagoLanguageCode {
  @JsonValue('ko')
  ko,
  @JsonValue('en')
  en,
  @JsonValue('ja')
  ja,
  @JsonValue('zh-cn')
  zhCn,
  @JsonValue('zh-tw')
  zhTw,
  @JsonValue('vi')
  vi,
  @JsonValue('id')
  id,
  @JsonValue('th')
  th,
  @JsonValue('de')
  de,
  @JsonValue('ru')
  ru,
  @JsonValue('es')
  es,
  @JsonValue('it')
  it,
  @JsonValue('fr')
  fr,
}

extension PapagoLanguageCodeExtension on PapagoLanguageCode {
  String get code {
    switch (this) {
      case PapagoLanguageCode.ko:
        return 'ko';
      case PapagoLanguageCode.en:
        return 'en';
      case PapagoLanguageCode.ja:
        return 'ja';
      case PapagoLanguageCode.zhCn:
        return 'zh-CN';
      case PapagoLanguageCode.zhTw:
        return 'zh-TW';
      case PapagoLanguageCode.vi:
        return 'vi';
      case PapagoLanguageCode.id:
        return 'id';
      case PapagoLanguageCode.th:
        return 'th';
      case PapagoLanguageCode.de:
        return 'de';
      case PapagoLanguageCode.ru:
        return 'ru';
      case PapagoLanguageCode.es:
        return 'es';
      case PapagoLanguageCode.it:
        return 'it';
      case PapagoLanguageCode.fr:
        return 'fr';
    }
  }

  String get name {
    switch (this) {
      case PapagoLanguageCode.ko:
        return '한국어';
      case PapagoLanguageCode.en:
        return '영어';
      case PapagoLanguageCode.ja:
        return '일본어';
      case PapagoLanguageCode.zhCn:
        return '중국어(간체)';
      case PapagoLanguageCode.zhTw:
        return '중국어(번체)';
      case PapagoLanguageCode.vi:
        return '베트남어';
      case PapagoLanguageCode.id:
        return '인도네시아어';
      case PapagoLanguageCode.th:
        return '태국어';
      case PapagoLanguageCode.de:
        return '독일어';
      case PapagoLanguageCode.ru:
        return '러시아어';
      case PapagoLanguageCode.es:
        return '스페인어';
      case PapagoLanguageCode.it:
        return '이탈리아어';
      case PapagoLanguageCode.fr:
        return '프랑스어';
    }
  }
}

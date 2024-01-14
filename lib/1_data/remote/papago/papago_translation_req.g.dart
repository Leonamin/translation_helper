// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'papago_translation_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PapagoTranslationReq _$PapagoTranslationReqFromJson(
        Map<String, dynamic> json) =>
    PapagoTranslationReq(
      source: $enumDecode(_$PapagoLanguageCodeEnumMap, json['source']),
      target: $enumDecode(_$PapagoLanguageCodeEnumMap, json['target']),
      text: json['text'] as String,
    );

Map<String, dynamic> _$PapagoTranslationReqToJson(
        PapagoTranslationReq instance) =>
    <String, dynamic>{
      'source': _$PapagoLanguageCodeEnumMap[instance.source]!,
      'target': _$PapagoLanguageCodeEnumMap[instance.target]!,
      'text': instance.text,
    };

const _$PapagoLanguageCodeEnumMap = {
  PapagoLanguageCode.ko: 'ko',
  PapagoLanguageCode.en: 'en',
  PapagoLanguageCode.ja: 'ja',
  PapagoLanguageCode.zhCn: 'zh-cn',
  PapagoLanguageCode.zhTw: 'zh-tw',
  PapagoLanguageCode.vi: 'vi',
  PapagoLanguageCode.id: 'id',
  PapagoLanguageCode.th: 'th',
  PapagoLanguageCode.de: 'de',
  PapagoLanguageCode.ru: 'ru',
  PapagoLanguageCode.es: 'es',
  PapagoLanguageCode.it: 'it',
  PapagoLanguageCode.fr: 'fr',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'papago_translation_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PapagoTranslationRes _$PapagoTranslationResFromJson(
        Map<String, dynamic> json) =>
    PapagoTranslationRes(
      message: PapagoResultMessageRes.fromJson(
          json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PapagoTranslationResToJson(
        PapagoTranslationRes instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

PapagoResultMessageRes _$PapagoResultMessageResFromJson(
        Map<String, dynamic> json) =>
    PapagoResultMessageRes(
      type: json['@type'] as String,
      service: json['@service'] as String,
      version: json['@version'] as String,
      result: PapagoTranslatedTextRes.fromJson(
          json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PapagoResultMessageResToJson(
        PapagoResultMessageRes instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@service': instance.service,
      '@version': instance.version,
      'result': instance.result,
    };

PapagoTranslatedTextRes _$PapagoTranslatedTextResFromJson(
        Map<String, dynamic> json) =>
    PapagoTranslatedTextRes(
      srcLangType: json['srcLangType'] as String,
      tarLangType: json['tarLangType'] as String,
      translatedText: json['translatedText'] as String,
    );

Map<String, dynamic> _$PapagoTranslatedTextResToJson(
        PapagoTranslatedTextRes instance) =>
    <String, dynamic>{
      'srcLangType': instance.srcLangType,
      'tarLangType': instance.tarLangType,
      'translatedText': instance.translatedText,
    };

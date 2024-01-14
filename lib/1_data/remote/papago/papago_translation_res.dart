import 'package:json_annotation/json_annotation.dart';

part 'papago_translation_res.g.dart';

@JsonSerializable()
class PapagoTranslationRes {
  @JsonKey(name: 'message')
  final PapagoResultMessageRes message;

  const PapagoTranslationRes({
    required this.message,
  });

  factory PapagoTranslationRes.fromJson(Map<String, dynamic> json) =>
      _$PapagoTranslationResFromJson(json);

  Map<String, dynamic> toJson() => _$PapagoTranslationResToJson(this);
}

@JsonSerializable()
class PapagoResultMessageRes {
  @JsonKey(name: '@type')
  final String type;
  @JsonKey(name: '@service')
  final String service;
  @JsonKey(name: '@version')
  final String version;
  @JsonKey(name: 'result')
  final PapagoTranslatedTextRes result;

  const PapagoResultMessageRes({
    required this.type,
    required this.service,
    required this.version,
    required this.result,
  });

  factory PapagoResultMessageRes.fromJson(Map<String, dynamic> json) =>
      _$PapagoResultMessageResFromJson(json);

  Map<String, dynamic> toJson() => _$PapagoResultMessageResToJson(this);
}

@JsonSerializable()
class PapagoTranslatedTextRes {
  @JsonKey(name: 'srcLangType')
  final String srcLangType;
  @JsonKey(name: 'tarLangType')
  final String tarLangType;
  @JsonKey(name: 'translatedText')
  final String translatedText;

  const PapagoTranslatedTextRes({
    required this.srcLangType,
    required this.tarLangType,
    required this.translatedText,
  });

  factory PapagoTranslatedTextRes.fromJson(Map<String, dynamic> json) =>
      _$PapagoTranslatedTextResFromJson(json);

  Map<String, dynamic> toJson() => _$PapagoTranslatedTextResToJson(this);
}

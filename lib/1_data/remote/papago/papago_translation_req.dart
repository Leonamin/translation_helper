import 'package:json_annotation/json_annotation.dart';
import 'package:translation_helper/1_data/model/papago/papago_language_code.dart';

part 'papago_translation_req.g.dart';

@JsonSerializable()
class PapagoTranslationReq {
  @JsonKey(name: 'source')
  final PapagoLanguageCode source;
  @JsonKey(name: 'target')
  final PapagoLanguageCode target;
  @JsonKey(name: 'text')
  final String text;

  PapagoTranslationReq({
    required this.source,
    required this.target,
    required this.text,
  }) {
    if (text.isEmpty) throw ArgumentError('번역할 내용이 없습니다.');
    if (text.length > 5000) throw ArgumentError('파파고 번역은 5000자까지 가능합니다.');
  }

  factory PapagoTranslationReq.fromJson(Map<String, dynamic> json) =>
      _$PapagoTranslationReqFromJson(json);

  Map<String, dynamic> toJson() => _$PapagoTranslationReqToJson(this);

  Map<String, String> toMap() {
    return {
      'source': source.code,
      'target': target.code,
      'text': text,
    };
  }
}

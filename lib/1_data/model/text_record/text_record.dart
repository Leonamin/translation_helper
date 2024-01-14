class TextRecord {
  final String fileName;
  final String version;
  final String keyId;
  final String originalText;
  final String? translatedText;
  final bool isTranslated;

  const TextRecord({
    required this.fileName,
    required this.version,
    required this.keyId,
    required this.originalText,
    required this.translatedText,
    required this.isTranslated,
  });
}

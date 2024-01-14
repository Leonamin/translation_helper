import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:translation_helper/1_data/model/papago/papago_model.dart';
import 'package:translation_helper/1_data/model/text_record/text_record.dart';
import 'package:translation_helper/4_view/component/snackbar/snackbar_widget.dart';
import 'package:translation_helper/util/snackbar/shrew_snackbar_utils.dart';
import 'package:xml/xml.dart';

class FileDetailViewModel extends ChangeNotifier {
  final PapagoModel _papagoModel = PapagoModel();

  FileDetailViewModel(this.filePath);

  final String filePath;

  String fileContent = '';

  String get fileName => filePath.split('/').last;

  List<TextRecord> listKeyRecord = [];

  bool isXmlFileKeyListMode = false;

  String translatedText = '';

  onInit(BuildContext context) async {
    _openFile(context);
  }

  bool _isXmlFile() {
    return filePath.endsWith('.xml');
  }

  void _openFile(BuildContext context) {
    if (!_isXmlFile()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ShrewSnackBarUtils.showSnackBar(
          context,
          title: 'xml 파일이 아닙니다.',
          type: SnackBarType.error,
        );

        context.pop();
      });

      return;
    }

    _readFileContent(filePath);
  }

  Future<void> _readFileContent(String filePath) async {
    fileContent = await File(filePath).readAsString();
    notifyListeners();
  }

  // xml 파싱

  void onTapConvertXmlKey(BuildContext context) {
    _parseXml(fileContent).then((records) {
      listKeyRecord = records;
      isXmlFileKeyListMode = true;
      notifyListeners();
    });
  }

  Future<List<TextRecord>> _parseXml(
    String xmlContent, {
    String elementKey = 'string',
    String textKeyId = 'id',
    String textKeyText = 'text',
  }) async {
    var document = XmlDocument.parse(xmlContent);
    var records = <TextRecord>[];

    for (var stringElement in document.findAllElements(elementKey)) {
      var id = stringElement.getAttribute(textKeyId) ?? '';
      var text = stringElement.getAttribute(textKeyText) ?? '';
      records.add(TextRecord(
        fileName: 'example.xml',
        version: '1.0',
        keyId: id,
        originalText: text,
        translatedText: null,
        isTranslated: false,
      ));
    }

    return records;
  }

  void onTapKeyRecord(BuildContext context, TextRecord record) {
    _translateText(record.originalText, (Exception e) {
      ShrewSnackBarUtils.showSnackBar(
        context,
        title: '번역에 실패했습니다. 에러 상세 = $e',
        type: SnackBarType.error,
      );
    });
  }

  Future<void> _translateText(
    String text, [
    Function(Exception)? onFailure,
  ]) async {
    final result = await _papagoModel.translateFromKoToEn(text);
    result
      ..onFailure((e) {
        Logger().e(e);
        print(e);
        onFailure?.call(e);
      })
      ..onSuccess((text) {
        translatedText = text;
        notifyListeners();
      });
  }
}

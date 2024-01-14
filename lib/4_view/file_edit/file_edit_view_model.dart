import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:translation_helper/4_view/file_edit/file_edit_view.dart';

class FileEditViewModel extends ChangeNotifier {
  FileEditViewModel(this.arguments);

  final FileEditViewArguments? arguments;

  String filePath = '';

  String fileContent = '';

  String get fileName => filePath.split('/').last;

  onInit(BuildContext context) {
    if (arguments == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return;
    }

    filePath = arguments!.path;
    notifyListeners();
    _openFile();
  }

  void _openFile() {
    var file = File(filePath);

    // 파일을 열고 Stream을 얻습니다.
    Stream<List<int>> inputStream = file.openRead();

    inputStream.listen(
      _onListenFileInputStream,
      onDone: () {},
      onError: (e) {
        Logger().e(e);
      },
    );
  }

  getFileStream() {
    return Stream.value(fileContent);
  }

  // void _onListenFileInputStream(String line) {
  //   fileContent += line;
  //   notifyListeners();
  // }

  void _onListenFileInputStream(List<int> binaryData) async {
    for (var i = 0; i < binaryData.length; i++) {
      fileContent += String.fromCharCode(binaryData[i]);
    }
    // notifyListeners();
  }
}

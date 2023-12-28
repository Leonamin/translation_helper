import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:translation_helper/routes.dart';
import 'package:translation_helper/view/file_edit/file_edit_view.dart';

class FileDragAndDropViewModel extends ChangeNotifier {
  FileDragAndDropViewModel();

  bool _isDragging = false;
  bool get isDragging => _isDragging;

  final List<XFile> _fileList = [];
  List<XFile> get fileList => _fileList;

  void setDragging(bool isDragging) {
    _isDragging = isDragging;
    notifyListeners();
  }

  void onActionAddFiles(List<XFile> files) {
    _handleFiles(files);
  }

  Future<bool> _checkIsFile(String filePath) {
    return FileSystemEntity.isDirectory(filePath);
  }

  Future<void> _handleFiles(List<XFile> files) async {
    if (files.isEmpty) {
      return;
    }

    for (final file in files) {
      if (_isFileExist(file.path)) {
        continue;
      }
      if (await _checkIsFile(file.path)) {
        Logger().e('isDirectoryError : ${file.path}');
        // TODO : 스낵바나 토스트 메시지로 알려주기
        continue;
      }
      _fileList.add(file);
    }

    notifyListeners();
  }

  bool _isFileExist(String path) {
    return _fileList.any((element) => element.path == path);
  }

  void _removeFile(int index) {
    _fileList.removeAt(index);
    notifyListeners();
  }

  void onActionRemove(int index) {
    _removeFile(index);
  }

  void onTapFile(BuildContext context, int index) {
    // GO TO EDIT
    context.goNamed(
      ViewRoutes.fileDragAndDrop.name,
      extra: FileEditViewArguments(
        path: fileList[index].path,
      ),
    );
  }
}

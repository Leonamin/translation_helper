import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';

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

  void addFiles(List<XFile> files) {
    if (files.isEmpty) {
      return;
    }

    for (final file in files) {
      if (isFileExist(file.path)) {
        continue;
      }
      _fileList.add(file);
    }

    notifyListeners();
  }

  bool isFileExist(String path) {
    return _fileList.any((element) => element.path == path);
  }

  void _removeFile(int index) {
    _fileList.removeAt(index);
    notifyListeners();
  }

  void onActionRemove(int index) {
    _removeFile(index);
  }

  void onTapFile(int index) {
    // GO TO EDIT
  }
}

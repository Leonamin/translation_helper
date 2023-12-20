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

  void addFiles(List<XFile> file) {
    _fileList.addAll(file);
    notifyListeners();
  }

  void removeFile(int index) {
    _fileList.removeAt(index);
    notifyListeners();
  }
}

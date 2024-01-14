import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:translation_helper/2_res/route/route_config.dart';
import 'package:translation_helper/4_view/component/snackbar/snackbar_widget.dart';
import 'package:translation_helper/util/snackbar/shrew_snackbar_utils.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel();

  bool _isDragging = false;
  bool get isDragging => _isDragging;

  final List<XFile> _fileList = [];
  List<XFile> get fileList => _fileList;

  void setDragging(bool isDragging) {
    _isDragging = isDragging;
    notifyListeners();
  }

  void onActionAddFiles(
    BuildContext context,
    List<XFile> files,
  ) {
    _handleFiles(files, () {
      ShrewSnackBarUtils.showSnackBar(
        context,
        title: '디렉토리는 추가할 수 없습니다.',
        type: SnackBarType.error,
      );
    });
  }

  Future<bool> _checkIsFile(String filePath) {
    return FileSystemEntity.isDirectory(filePath);
  }

  Future<void> _handleFiles(List<XFile> files, VoidCallback onError) async {
    if (files.isEmpty) {
      return;
    }

    for (final file in files) {
      if (_isFileExist(file.path)) {
        continue;
      }
      if (await _checkIsFile(file.path)) {
        Logger().e('isDirectoryError : ${file.path}');
        onError();
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

  void onTapRemove(int index) {
    _removeFile(index);
  }

  void onTapFile(BuildContext context, int index) {
    final filePath = _fileList[index].path;
    // GO TO EDIT
    context.goNamed(
      RouteConfig.fileDetail.routeName,
      pathParameters: {
        'file_path': filePath,
      },
    );
  }
}

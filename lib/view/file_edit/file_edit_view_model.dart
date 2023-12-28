import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:translation_helper/view/file_edit/file_edit_view.dart';

class FileEditViewModel extends ChangeNotifier {
  FileEditViewModel(this.arguments);

  final FileEditViewArguments? arguments;

  String filePath = '';

  onInit(BuildContext context) {
    if (arguments == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return;
    }

    filePath = arguments!.path;
    notifyListeners();
  }
}

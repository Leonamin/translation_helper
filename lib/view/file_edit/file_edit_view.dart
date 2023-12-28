import 'package:flutter/material.dart';
import 'package:translation_helper/view/file_edit/file_edit_view_model.dart';

class FileEditViewArguments {
  const FileEditViewArguments({
    required this.path,
  });

  final String path;
}

class FileEditView extends StatefulWidget {
  const FileEditView({
    super.key,
    this.arguments,
  });

  final FileEditViewArguments? arguments;

  @override
  State<FileEditView> createState() => _FileEditViewState();
}

class _FileEditViewState extends State<FileEditView> {
  late final FileEditViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = FileEditViewModel(widget.arguments);
    viewModel.onInit(context);
    viewModel.addListener(listener);
  }

  @override
  void dispose() {
    viewModel.removeListener(listener);
    super.dispose();
  }

  void listener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.filePath),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:translation_helper/theme/text_styles.dart';
import 'package:translation_helper/4_view/file_edit/file_edit_view_model.dart';

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
        title: Text(viewModel.fileName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: StreamBuilder(
            stream: viewModel.getFileStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SelectableText(
                  snapshot.data.toString(),
                  style: TextStyles.body,
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          // child: SelectableText(
          //   viewModel.fileContent,
          //   style: TextStyles.body,
          // ),
        ),
      ),
    );
  }
}

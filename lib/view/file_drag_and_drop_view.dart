import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:translation_helper/theme/text_styles.dart';
import 'package:translation_helper/view/file_drag_and_drop_view_model.dart';

class FileDragAndDropView extends StatefulWidget {
  const FileDragAndDropView({super.key});

  static const String _strTitle = '파일을 여기에 끌어다 놓으세요';

  @override
  State<FileDragAndDropView> createState() => _FileDragAndDropViewState();
}

class _FileDragAndDropViewState extends State<FileDragAndDropView> {
  final FileDragAndDropViewModel viewModel = FileDragAndDropViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.addListener(listener);
  }

  @override
  void dispose() {
    viewModel.removeListener(listener);
    super.dispose();
  }

  // 리스너
  void listener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const Text(
                FileDragAndDropView._strTitle,
                style: TextStyles.title,
              ),
              const SizedBox(height: 32),
              DropTarget(
                onDragDone: (detail) {
                  viewModel.addFiles(detail.files);
                },
                onDragEntered: (detail) {
                  viewModel.setDragging(true);
                },
                onDragExited: (detail) {
                  viewModel.setDragging(false);
                },
                child: DottedBorder(
                  radius: const Radius.circular(8),
                  dashPattern: const [5.0, 5.0],
                  borderType: BorderType.RRect,
                  child: Container(
                    constraints: const BoxConstraints(
                      minHeight: 200,
                    ),
                    child: const Center(
                      child: Icon(Icons.upload_rounded, size: 64),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  title: Text(viewModel.fileList[index].name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      viewModel.removeFile(index);
                    },
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: viewModel.fileList.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

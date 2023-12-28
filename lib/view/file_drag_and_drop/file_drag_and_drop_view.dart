import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:translation_helper/theme/text_styles.dart';
import 'package:translation_helper/view/file_drag_and_drop/file_drag_and_drop_view_model.dart';

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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      viewModel.onActionAddFiles(detail.files);
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
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          color: viewModel.isDragging
                              ? Colors.black.withOpacity(0.5)
                              : Colors.transparent,
                        ),
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          constraints: const BoxConstraints(
                            minHeight: 200,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: const Center(
                            child: Icon(Icons.upload_rounded, size: 64),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      title: InkWell(
                        onTap: () {
                          viewModel.onTapFile(context, index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            viewModel.fileList[index].name,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => viewModel.onActionRemove(index),
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: viewModel.fileList.length,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

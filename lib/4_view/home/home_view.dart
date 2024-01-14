import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:translation_helper/2_res/constants/strings.dart';
import 'package:translation_helper/4_view/home/home_view_model.dart';
import 'package:translation_helper/theme/text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  const Text(
                    Strings.strFileDropZone,
                    style: TextStyles.title,
                  ),
                  const SizedBox(height: 32),
                  ListenableBuilder(
                    listenable: viewModel,
                    builder: (context, child) => _DropZoneWidget(
                      isDragging: viewModel.isDragging,
                      onDragDone: (detail) {
                        viewModel.onActionAddFiles(context, detail.files);
                      },
                      onDragEndtered: (detail) {
                        viewModel.setDragging(true);
                      },
                      onDragExited: (detail) {
                        viewModel.setDragging(false);
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  ListenableBuilder(
                    listenable: viewModel,
                    builder: (context, child) => _FileListWidget(
                      fileList: viewModel.fileList,
                      onTapFile: (context, index) {
                        viewModel.onTapFile(context, index);
                      },
                      onTapRemoveFile: (context, index) {
                        viewModel.onTapRemove(index);
                      },
                    ),
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

class _DropZoneWidget extends StatelessWidget {
  const _DropZoneWidget({
    this.onDragDone,
    this.onDragEndtered,
    this.onDragExited,
    this.isDragging = false,
  });

  final Function(DropDoneDetails)? onDragDone;
  final Function(DropEventDetails)? onDragEndtered;
  final Function(DropEventDetails)? onDragExited;

  final bool isDragging;

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: onDragDone,
      onDragEntered: onDragEndtered,
      onDragExited: onDragExited,
      child: DottedBorder(
        radius: const Radius.circular(8),
        dashPattern: const [5.0, 5.0],
        borderType: BorderType.RRect,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color:
                isDragging ? Colors.black.withOpacity(0.5) : Colors.transparent,
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
    );
  }
}

class _FileListWidget extends StatelessWidget {
  const _FileListWidget({
    this.onTapFile,
    this.onTapRemoveFile,
    this.fileList = const [],
  });

  final Function(BuildContext, int)? onTapFile;
  final Function(BuildContext, int)? onTapRemoveFile;
  final List<XFile> fileList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => ListTile(
        title: InkWell(
          onTap: () => onTapFile?.call(context, index),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              fileList[index].name,
            ),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => onTapRemoveFile?.call(context, index),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: fileList.length,
    );
  }
}

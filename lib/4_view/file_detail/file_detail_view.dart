import 'package:flutter/material.dart';
import 'package:translation_helper/1_data/model/text_record/text_record.dart';
import 'package:translation_helper/2_res/app_theme/color_hue.dart';
import 'package:translation_helper/4_view/component/appbar/main_appbar.dart';
import 'package:translation_helper/4_view/file_detail/file_detail_view_model.dart';
import 'package:translation_helper/theme/text_styles.dart';

class FileDetailView extends StatelessWidget {
  const FileDetailView({
    super.key,
    required this.filePath,
  });

  final String filePath;

  @override
  Widget build(BuildContext context) {
    final viewModel = FileDetailViewModel(filePath);
    viewModel.onInit(context);
    return Scaffold(
      appBar: MainAppBar.title(title: '파일 상세'),
      backgroundColor: ColorHue.grey1,
      body: Row(
        children: [
          Expanded(
            child: ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {
                if (viewModel.isXmlFileKeyListMode) {
                  return _FoundKeyListWidget(
                    foundKeyList: viewModel.listKeyRecord,
                  );
                }

                return _RawContentWidget(
                  content: viewModel.fileContent,
                );
              },
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onTapConvertXmlKey(context);
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}

class _RawContentWidget extends StatelessWidget {
  const _RawContentWidget({
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        content,
      ),
    );
  }
}

class _FoundKeyListWidget extends StatelessWidget {
  const _FoundKeyListWidget({
    required this.foundKeyList,
  });

  final List<TextRecord> foundKeyList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: foundKeyList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemBuilder: (context, index) {
        final textRecord = foundKeyList[index];
        return _TextRecordWidget(
          textRecord: textRecord,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}

class _TextRecordWidget extends StatelessWidget {
  const _TextRecordWidget({
    required this.textRecord,
  });

  final TextRecord textRecord;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textRecord.originalText,
              style: TextStyles.body.medium,
            ),
          ],
        ),
      ),
    );
  }
}

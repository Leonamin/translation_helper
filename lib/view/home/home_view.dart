import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation_helper/3_di/providers.dart';
import 'package:translation_helper/view/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        homeViewModelProvider.overrideWithValue(HomeViewModel()),
      ],
      child: Scaffold(
          body: _WorkSpaceGridWidget(),
          floatingActionButton: Consumer(
            builder: (context, ref, child) {
              final viewModel = ref.read(homeViewModelProvider);
              return FloatingActionButton(
                onPressed: () {
                  viewModel.onTapAddWorkSpace();
                },
                child: const Icon(Icons.add),
              );
            },
          )),
    );
  }
}

class _WorkSpaceGridWidget extends ConsumerWidget {
  const _WorkSpaceGridWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(homeViewModelProvider);
    viewModel.init();

    print('asdasd');

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: viewModel.workspaceList.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                '${viewModel.workspaceList[index].name}}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        );
      },
    );
  }
}

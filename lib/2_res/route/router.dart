import 'package:go_router/go_router.dart';
import 'package:translation_helper/4_view/file_detail/file_detail_view.dart';
import 'package:translation_helper/4_view/home/home_view.dart';

final viewRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeView(),
      routes: [
        GoRoute(
          path: ':file_path',
          name: 'file_detail',
          builder: (context, state) {
            final filePath = state.pathParameters['file_path']!;
            return FileDetailView(
              filePath: filePath,
            );
          },
        ),
      ],
    ),
  ],
);

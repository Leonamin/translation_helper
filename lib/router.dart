import 'package:go_router/go_router.dart';
import 'package:translation_helper/view/file_drag_and_drop/file_drag_and_drop_view.dart';

final viewRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FileDragAndDropView(),
    ),
  ],
);

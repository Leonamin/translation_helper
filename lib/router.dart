import 'package:go_router/go_router.dart';
import 'package:translation_helper/routes.dart';
import 'package:translation_helper/view/file_drag_and_drop/file_drag_and_drop_view.dart';
import 'package:translation_helper/view/file_edit/file_edit_view.dart';

final viewRouter = GoRouter(
  routes: [
    GoRoute(
      path: ViewRoutes.fileDragAndDrop.path,
      builder: (context, state) => const FileDragAndDropView(),
      routes: [
        GoRoute(
          path: ViewRoutes.edit.path,
          builder: (context, state) => FileEditView(
            arguments: state.extra as FileEditViewArguments?,
          ),
          name: 'edit',
        ),
      ],
    ),
  ],
);

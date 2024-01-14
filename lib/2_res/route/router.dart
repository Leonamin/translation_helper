import 'package:go_router/go_router.dart';
import 'package:translation_helper/view/home/home_view.dart';

final viewRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
  ],
);

import 'package:go_router/go_router.dart';
import 'package:translation_helper/4_view/home/home_view.dart';

final viewRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
  ],
);

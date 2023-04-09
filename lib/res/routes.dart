import 'package:add_thing_todo/view/introduction/get_started.dart';
import 'package:add_thing_todo/view/introduction/introduction.dart';
import 'package:add_thing_todo/view/login/register.dart';
import 'package:go_router/go_router.dart';

import '../view/login/login.dart';

class AppRoutes {
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Introduction(),
    ),
    GoRoute(
      path: GetStartedPage.path,
      builder: (context, state) => const GetStartedPage(),
    ),
    GoRoute(
      path: LoginPage.path,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
        path: RegisterPage.path,
        builder: ((context, state) => const RegisterPage()))
  ]);
}

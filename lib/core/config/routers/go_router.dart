import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:perla/features/home/persentation/home_page.dart';
import 'package:perla/features/login/presentation/page/login_page.dart';
import 'package:perla/features/register/presentation/page/register_page.dart';
import 'package:perla/features/splash/presentation/page/splash_page.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter goRouter = GoRouter(
  initialLocation: SplashPage.kSplashPath,
  observers: [GoRouterObserver()],
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: SplashPage.kSplashPath,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SplashPage()),
    ),
    GoRoute(
      path: LoginPage.kLoginPath,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginPage()),
    ),
    GoRoute(
      path: RegisterPage.kRegisterPath,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: RegisterPage()),
    ),
    GoRoute(
      path: HomePage.kHomePath,
      pageBuilder: (context, state) =>
      const NoTransitionPage(child: HomePage()),
    ),
  ],
);

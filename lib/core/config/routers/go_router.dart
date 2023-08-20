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
    // GoRoute(
    //   path: SignUpPage.kSignUpPath,
    //   pageBuilder: (context, state) => const NoTransitionPage(
    //     child: SignUpPage(),
    //   ),
    //   routes: [
    //     GoRoute(
    //       path: AddressPage.kAddressPath,
    //       pageBuilder: (context, state) => const NoTransitionPage(
    //         child: AddressPage(),
    //       ),
    //     ),
    //   ],
    // ),
    // ShellRoute(
    //   navigatorKey: _shellNavigatorKey,
    //   pageBuilder: (context, state, child) {
    //     return NoTransitionPage(
    //       child: bottomNavigationBar(
    //         child: child,
    //       ),
    //     );
    //   },
    //   routes: [
    //     GoRoute(
    //       path: HomePage.kHomePath,
    //       pageBuilder: (context, state) => const NoTransitionPage(
    //         child: HomePage(),
    //       ),
    //     ),
    //     GoRoute(
    //         path: MyOrdersPage.kMyOrdersPage,
    //         pageBuilder: (context, state) => const NoTransitionPage(
    //               child: MyOrdersPage(),
    //             ),
    //         routes: [
    //           GoRoute(
    //             path: '${OrderDeatilsPage.kOrderDetails}/:orderId',
    //             pageBuilder: (context, state) => NoTransitionPage(
    //               child: OrderDeatilsPage(
    //                 orderId: state.pathParameters['orderId'] ?? '',
    //               ),
    //             ),
    //           ),
    //         ]),
    //     GoRoute(
    //       path: CartPage.kCartPage,
    //       pageBuilder: (context, state) => const NoTransitionPage(
    //         child: CartPage(),
    //       ),
    //     ),
    //     GoRoute(
    //         path: OfferNewsPage.kOfferNewsPage,
    //         pageBuilder: (context, state) => const NoTransitionPage(
    //               child: OfferNewsPage(),
    //             ),
    //         routes: [
    //           GoRoute(
    //             path: OfferPage.kOfferPage,
    //             pageBuilder: (context, state) => const NoTransitionPage(
    //               child: OfferPage(),
    //             ),
    //           ),
    //           GoRoute(
    //             path: NewsPage.kNewsPage,
    //             pageBuilder: (context, state) => const NoTransitionPage(
    //               child: NewsPage(),
    //             ),
    //           ),
    //         ])
    //   ],
    // ),
  ],
);

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perla/app/presentation/bloc/app_bloc.dart';
import 'package:perla/app/presentation/bloc/app_state.dart';
import 'package:perla/core/config/routers/go_router.dart';
import 'package:perla/core/utils/constants.dart';
import 'package:perla/injection.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final bloc = sl<AppBloc>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    bloc.getInitColor();
    bloc.getAppLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // For portrait use only
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return ScreenUtilInit(
      designSize: const Size(ScreenDesignSize.width, ScreenDesignSize.height),
      builder: (context, child) {
        return BlocBuilder<AppBloc,AppState>(
          bloc: bloc,
          builder: (BuildContext context, AppState state) {
            return MaterialApp.router(
              routerConfig: goRouter,
              debugShowCheckedModeBanner: false,
              // localizationsDelegates: context.localizationDelegates,
              // locale: context.locale,
              // supportedLocales: context.supportedLocales,
              theme: ThemeData(
                // primaryColor: const Color(0x006c63ff),
                iconTheme: const IconThemeData(
                  color: Color(0xFF002773),
                ),
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(
                      primary: const Color(0xff6C63FF),
                      secondary: const Color(0xFF286be6),
                    )
                    .copyWith(background: const Color(0xffedf3ff)),
              ),
            );
          },
        );
      },
    );
  }
}
//import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:meshwar/features/auth/presentation/pages/auth_page.dart';
// import 'package:meshwar/features/feedback/presentation/page/feedback_page.dart';
// import 'package:meshwar/features/map/presentation/pages/map_page.dart';
// import 'package:meshwar/features/splash/presentation/pages/splash_page.dart';
// import 'package:meshwar/features/trip_history/presentation/pages/trip_history.dart';
// import '../../core/util/app_language.dart';
// import '../../core/util/app_localizations.dart';
// import '../../core/util/constants.dart';
// import '../../core/util/generate_screen.dart';
//
// import '../../features/map/presentation/pages/map_page.dart';
// import '../../injection.dart';
// import 'bloc/app_bloc.dart';
// import 'bloc/app_state.dart';
//
// class App extends StatefulWidget {
//   const App({Key? key}) : super(key: key);
//   static final GlobalKey<NavigatorState> navigatorKey =
//   GlobalKey<NavigatorState>();
//   @override
//   State<App> createState() => _AppState();
// }
//
// class _AppState extends State<App> {
//   final bloc = sl<AppBloc>();
//
//   @override
//   void initState() {
//     bloc.getAppLanguage();
//     // NotificationController.startListeningNotificationEvents();
//     // NotificationController.requestFirebaseToken();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // For portrait use only
//     SystemChrome.setPreferredOrientations(
//       [
//         DeviceOrientation.portraitUp,
//         DeviceOrientation.portraitDown,
//       ],
//     );
//
//     return ScreenUtilInit(
//       designSize: const Size(ScreenDesignSize.width, ScreenDesignSize.height),
//       builder: (context, child) {
//         return BlocBuilder(
//           bloc: bloc,
//           builder: (BuildContext context, AppState state) {
//             return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               home: const SplashPage(),
//               locale: state.appLanguage != AppLanguageKeys.ar
//                   ? const Locale('ar', '')
//                   : const Locale('en', ''),
//               onGenerateRoute: GenerateScreen.onGenerate,
//               localizationsDelegates: const [
//                 AppLocalizations.delegate,
//                 GlobalMaterialLocalizations.delegate,
//                 GlobalCupertinoLocalizations.delegate,
//                 GlobalWidgetsLocalizations.delegate,
//               ],
//               supportedLocales: const [
//                 Locale('en', ''),
//                 Locale('ar', ''),
//               ],
//               theme: ThemeData(
//                 fontFamily: 'Roboto',
//                 backgroundColor: const Color(0xffedf3ff),
//                 colorScheme: ColorScheme.fromSwatch().copyWith(
//                   primary: const Color(0xFF002773),
//                   secondary: const Color(0xFF286be6),
//                 ),
//                 iconTheme: const IconThemeData(
//                   color: Color(0xFF002773),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
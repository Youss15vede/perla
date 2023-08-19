import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:perla/app/presentation/page/app.dart';
import 'package:perla/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await EasyLocalization.ensureInitialized();
  // runApp(EasyLocalization(
  //     supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
  //     // fallbackLocale: const Locale('en', 'US'),
  //     path: 'assets/language',
  //     child: const App()));
  runApp(App());
}
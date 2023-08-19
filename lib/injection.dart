import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:perla/core/data/end_points.dart';
import 'package:perla/injection.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();

  @lazySingleton
  Dio get dio => getDio();

}

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async => $initGetIt(sl);

Dio getDio() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoint.baseURL,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      responseType: ResponseType.plain,
    ),
  );
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
    ),
  );
  return dio;
}

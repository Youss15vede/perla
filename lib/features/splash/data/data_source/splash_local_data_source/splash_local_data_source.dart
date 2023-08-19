import 'package:injectable/injectable.dart';
import 'package:perla/core/data/base_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SplashLocalDataSource extends BaseLocalDataSource {
}

@LazySingleton(as: SplashLocalDataSource)
class SplashLocalDataSourceImp extends BaseLocalDataSourceImp
    implements SplashLocalDataSource {

  SplashLocalDataSourceImp({
    required SharedPreferences sharedPreferences,
  }) : super(sharedPreferences: sharedPreferences);
}

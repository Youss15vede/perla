import 'package:injectable/injectable.dart';
import 'package:perla/app/domain/repository/app_repository.dart';
import 'package:perla/core/data/base_local_data_source.dart';


@LazySingleton(as: AppRepository)
class AppRepositoryImp implements AppRepository {

  final BaseLocalDataSource prefHelper;

  AppRepositoryImp(this.prefHelper);


  @override
  int getAppLanguage() {
    return prefHelper.getAppLanguage();
  }

  @override
  int getColor() {
    return prefHelper.getAppColor();
  }
}

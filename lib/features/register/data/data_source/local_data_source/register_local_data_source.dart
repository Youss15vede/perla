import 'package:perla/core/data/base_local_data_source.dart';
import 'package:perla/core/network/base_models/auth_model.dart';

abstract class RegisterLocalDataSource extends BaseLocalDataSource {
  Future<void> storeUser(AuthModel user);
}

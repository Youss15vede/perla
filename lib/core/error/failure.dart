import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String error;

  const Failure(this.error, [List properties = const <dynamic>[]]);

  @override
  List<Object> get props => [error];
}

class ServerFailure extends Failure {
  const ServerFailure({String error = ""}) : super(error);
}

class CacheFailure extends Failure {
  const CacheFailure({String error = ""}) : super(error);
}

// class PickFileFailure extends Failure {
//   const PickFileFailure({String error = ""}) : super(error);
// }

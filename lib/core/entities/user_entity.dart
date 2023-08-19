import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? userName;
  final int? points;
  final String? phoneNumber;
  final String? imagePath;
  final String? timesTamp;
  final String? userType;

  const UserEntity({
    required this.id,
    required this.userName,
    required this.points,
    required this.phoneNumber,
    required this.imagePath,
    required this.timesTamp,
    required this.userType,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        points,
        timesTamp,
      ];
}

import 'package:skud/models/user.dart';

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  User loadedUser;

  UserLoadedState({required this.loadedUser});
}

class UserErrorState extends UserState {}

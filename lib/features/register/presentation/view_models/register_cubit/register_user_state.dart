part of 'register_user_cubit.dart';

abstract class RegisterUserState {}

class RegisterUserInitial extends RegisterUserState {}

class RegisterUserLoading extends RegisterUserState {}

class RegisterUserFailure extends RegisterUserState {
  final String errMessage;

  RegisterUserFailure(this.errMessage);
}

class RegisterUserSuccess extends RegisterUserState {
  final MyUser user;

  RegisterUserSuccess(this.user);
}

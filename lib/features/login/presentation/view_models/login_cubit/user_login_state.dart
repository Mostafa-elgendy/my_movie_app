part of 'user_login_cubit.dart';

abstract class UserLoginState {}

class UserLoginInitial extends UserLoginState {}

class UserLoginLoading extends UserLoginState {}

class UserLoginFailure extends UserLoginState {
  final String errMessage;

  UserLoginFailure(this.errMessage);
}

class UserLoginSuccess extends UserLoginState {
  final MyUser user;

  UserLoginSuccess(this.user);
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/utils/user.dart';
import 'package:my_movie_app/features/login/data/repos/login_repo.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  LoginRepo loginRepo;
  UserLoginCubit({required this.loginRepo}) : super(UserLoginInitial());
  Future<void> userLogin(
      {required String email, required String password}) async {
    //print("Enter Cubit");
    emit(UserLoginLoading());
    var result = await loginRepo.login(email: email, password: password);
    result.fold((failure) {
      emit(UserLoginFailure(failure.message));
    }, (user) {
      emit(UserLoginSuccess(user));
    });
  }
}

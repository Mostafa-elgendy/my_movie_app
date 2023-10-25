import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/utils/user.dart';
import 'package:my_movie_app/features/register/data/repos/register_repo.dart';

part 'register_user_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit({required this.registerRepo})
      : super(RegisterUserInitial());
  RegisterRepo registerRepo;
  Future<void> registerUser(
      {required String email,
      required String password,
      required String name}) async {
    //print("Enter Cubit");
    emit(RegisterUserLoading());
    var result = await registerRepo.register(
        email: email, password: password, name: name);
    result.fold((failure) {
      emit(RegisterUserFailure(failure.message));
    }, (user) {
      emit(RegisterUserSuccess(user));
    });
  }
}

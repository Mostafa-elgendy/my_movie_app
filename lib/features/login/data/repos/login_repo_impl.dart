import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_movie_app/core/utils/user.dart';
import 'package:my_movie_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_movie_app/features/login/data/repos/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  MyUser? user;
  @override
  Future<Either<Failure, MyUser>> login(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        user = MyUser(
          email: email,
          password: password,
        );
      });
      return right(user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(LoginFailure("No user found for that email."));
      } else if (e.code == 'wrong-password') {
        return left(LoginFailure("Wrong password provided for that user"));
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return left(LoginFailure("email and password don't match"));
      }
      return left(LoginFailure(e.code));
    }
  }
}

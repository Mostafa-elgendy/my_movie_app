import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_movie_app/core/utils/user.dart';
import 'package:my_movie_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_movie_app/features/register/data/repos/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  MyUser? user;

  @override
  Future<Either<Failure, MyUser>> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        user = MyUser(
          email: email,
          password: password,
          name: name,
        );
      });
      return right(user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(
            RegisterFailure('Error: The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return left(RegisterFailure(
            'Error: The account already exists for that email.'));
      }

      return left(RegisterFailure(e.code));
    }
  }
}

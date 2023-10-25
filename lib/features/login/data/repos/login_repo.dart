import 'package:dartz/dartz.dart';
import 'package:my_movie_app/core/errors/failure.dart';
import 'package:my_movie_app/core/utils/user.dart';

abstract class LoginRepo {
  Future<Either<Failure, MyUser>> login(
      {required String email, required String password});
}

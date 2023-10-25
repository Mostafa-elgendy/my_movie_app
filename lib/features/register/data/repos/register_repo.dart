import 'package:dartz/dartz.dart';
import 'package:my_movie_app/core/errors/failure.dart';
import 'package:my_movie_app/core/utils/user.dart';

abstract class RegisterRepo {
  Future<Either<Failure, MyUser>> register(
      {required String email, required String password, required String name});
}

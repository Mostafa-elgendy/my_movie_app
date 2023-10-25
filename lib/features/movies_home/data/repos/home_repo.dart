import 'package:dartz/dartz.dart';
import 'package:my_movie_app/core/errors/failure.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMovies();
  Future<Either<Failure, List<MovieModel>>> fetchMovies(
      {required String category});
}

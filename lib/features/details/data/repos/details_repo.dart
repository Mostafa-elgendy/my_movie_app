import 'package:dartz/dartz.dart';
import 'package:my_movie_app/core/errors/failure.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/features/details/data/models/actor_model.dart';

abstract class DetailsRepo {
  Future<Either<Failure, List<MovieModel>>> fetchSimilarMovies(
      {required int movieId});
  Future<Either<Failure, List<ActorModel>>> fetchMovieCast(
      {required int movieId});
}

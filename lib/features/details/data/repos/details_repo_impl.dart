import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_movie_app/core/errors/failure.dart';
import 'package:my_movie_app/core/utils/api_services.dart';
import 'package:my_movie_app/core/utils/firebase_services.dart';
import 'package:my_movie_app/features/details/data/models/actor_model.dart';
import 'package:my_movie_app/features/details/data/repos/details_repo.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';

class DetailsRepoImpl extends DetailsRepo {
  final ApiService apiService;
  final FirebaseServices firebaseServices;

  DetailsRepoImpl(this.apiService, this.firebaseServices);

  @override
  Future<Either<Failure, List<ActorModel>>> fetchMovieCast(
      {required int movieId}) async {
    try {
      var data = await apiService.getActors(
        movieId: movieId,
      );
      //  print("Enter Newest");
      List<ActorModel> actors = [];
      for (var item in data["cast"]) {
        actors.add(ActorModel.fromJson(item));
      }
      return right(actors);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchSimilarMovies(
      {required int movieId}) async {
    try {
      var data = await apiService.getSimilar(
        movieId: movieId,
      );
      //  print("Enter Newest");
      List<MovieModel> movies = [];
      for (var item in data["results"]) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addToFavourite(
      {required MovieModel movieModel}) async {
    try {
      bool result = await firebaseServices.addToFavourite(
        movieModel,
      );
      //  print("Enter Newest");
      if (result == false) {
        return left(FirebaseFailure("error in firebase"));
      } else {
        return right(true);
      }
    } on Exception catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}

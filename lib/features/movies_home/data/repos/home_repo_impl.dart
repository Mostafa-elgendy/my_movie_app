import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_movie_app/core/errors/failure.dart';
import 'package:my_movie_app/core/utils/api_services.dart';
import 'package:my_movie_app/features/movies_home/data/repos/home_repo.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchMovies(
      {required String category}) async {
    try {
      var data = await apiService.get(
        endPoint: 'movie/$category?language=en-US',
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
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMovies() async {
    try {
      var data = await apiService.get(
        endPoint: 'trending/movie/day?language=en-US',
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
}

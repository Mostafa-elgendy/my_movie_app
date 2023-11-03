import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_movie_app/core/errors/failure.dart';
import 'package:my_movie_app/core/utils/api_series_services.dart';
import 'package:my_movie_app/features/series_home/data/model/series_model.dart';
import 'package:my_movie_app/features/series_home/data/repos/home_series_repo.dart';

class HomeSeriesRepoImpl extends HomeSeriesRepo {
  final ApiSeriesService apiService;

  HomeSeriesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<SeriesModel>>> fetchSeries(
      {required String category}) async {
    try {
      var data = await apiService.get(
        endPoint: '$category?language=en-US',
      );
      //  print("Enter Newest");
      List<SeriesModel> series = [];
      for (var item in data["results"]) {
        series.add(SeriesModel.fromJson(item));
      }
      return right(series);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

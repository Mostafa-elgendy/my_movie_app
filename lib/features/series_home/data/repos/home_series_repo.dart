import 'package:dartz/dartz.dart';
import 'package:my_movie_app/core/errors/failure.dart';
import 'package:my_movie_app/features/series_home/data/model/series_model.dart';

abstract class HomeSeriesRepo {
  Future<Either<Failure, List<SeriesModel>>> fetchSeries(
      {required String category});
}

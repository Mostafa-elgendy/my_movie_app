part of 'top_rated_series_cubit.dart';

abstract class TopRatedSeriesState {}

class TopRatedSeriesInitial extends TopRatedSeriesState {}

class TopRatedSeriesLoading extends TopRatedSeriesState {}

class TopRatedSeriesFailure extends TopRatedSeriesState {
  final String errMessage;

  TopRatedSeriesFailure(this.errMessage);
}

class TopRatedSeriesSuccess extends TopRatedSeriesState {
  final List<SeriesModel> series;

  TopRatedSeriesSuccess(this.series);
}

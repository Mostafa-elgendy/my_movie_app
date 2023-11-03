part of 'popular_series_cubit.dart';

abstract class PopularSeriesState {}

class PopularSeriesInitial extends PopularSeriesState {}

class PopularSeriesLoading extends PopularSeriesState {}

class PopularSeriesFailure extends PopularSeriesState {
  final String errMessage;

  PopularSeriesFailure(this.errMessage);
}

class PopularSeriesSuccess extends PopularSeriesState {
  final List<SeriesModel> series;

  PopularSeriesSuccess(this.series);
}

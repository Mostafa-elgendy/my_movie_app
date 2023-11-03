part of 'on_the_air_series_cubit.dart';

abstract class OnTheAirSeriesState {}

class OnTheAirSeriesInitial extends OnTheAirSeriesState {}

class OnTheAirSeriesLoading extends OnTheAirSeriesState {}

class OnTheAirSeriesFailure extends OnTheAirSeriesState {
  final String errMessage;

  OnTheAirSeriesFailure(this.errMessage);
}

class OnTheAirSeriesSuccess extends OnTheAirSeriesState {
  final List<SeriesModel> series;

  OnTheAirSeriesSuccess(this.series);
}

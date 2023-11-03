part of 'airing_today_series_cubit.dart';

abstract class AiringTodaySeriesState {}

class AiringTodaySeriesInitial extends AiringTodaySeriesState {}

class AiringTodaySeriesLoading extends AiringTodaySeriesState {}

class AiringTodaySeriesFailure extends AiringTodaySeriesState {
  final String errMessage;

  AiringTodaySeriesFailure(this.errMessage);
}

class AiringTodaySeriesSuccess extends AiringTodaySeriesState {
  final List<SeriesModel> series;

  AiringTodaySeriesSuccess(this.series);
}

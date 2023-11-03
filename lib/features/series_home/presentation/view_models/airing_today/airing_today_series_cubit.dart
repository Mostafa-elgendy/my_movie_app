import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/features/series_home/data/model/series_model.dart';
import 'package:my_movie_app/features/series_home/data/repos/home_series_repo.dart';

part 'airing_today_series_state.dart';

class AiringTodaySeriesCubit extends Cubit<AiringTodaySeriesState> {
  AiringTodaySeriesCubit(this.homeSeriesRepo)
      : super(AiringTodaySeriesInitial());
  final HomeSeriesRepo homeSeriesRepo;
  Future<void> fetchAiringTodaySeries() async {
    emit(AiringTodaySeriesLoading());
    var result = await homeSeriesRepo.fetchSeries(category: "airing_today");
    result.fold((failure) {
      emit(AiringTodaySeriesFailure(failure.message));
    }, (series) {
      emit(AiringTodaySeriesSuccess(series));
    });
  }
}

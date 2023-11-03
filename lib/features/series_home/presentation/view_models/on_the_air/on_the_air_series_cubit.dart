import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_movie_app/features/series_home/data/model/series_model.dart';
import 'package:my_movie_app/features/series_home/data/repos/home_series_repo.dart';

part 'on_the_air_series_state.dart';

class OnTheAirSeriesCubit extends Cubit<OnTheAirSeriesState> {
  OnTheAirSeriesCubit(this.homeSeriesRepo) : super(OnTheAirSeriesInitial());
  final HomeSeriesRepo homeSeriesRepo;
  Future<void> fetchOnTheAirSeries() async {
    emit(OnTheAirSeriesLoading());
    var result = await homeSeriesRepo.fetchSeries(category: "on_the_air");
    result.fold((failure) {
      emit(OnTheAirSeriesFailure(failure.message));
    }, (series) {
      emit(OnTheAirSeriesSuccess(series));
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/features/series_home/data/model/series_model.dart';
import 'package:my_movie_app/features/series_home/data/repos/home_series_repo.dart';

part 'top_rated_series_state.dart';

class TopRatedSeriesCubit extends Cubit<TopRatedSeriesState> {
  TopRatedSeriesCubit(this.homeSeriesRepo) : super(TopRatedSeriesInitial());
  final HomeSeriesRepo homeSeriesRepo;
  Future<void> fetchTopRatedSeries() async {
    emit(TopRatedSeriesLoading());
    var result = await homeSeriesRepo.fetchSeries(category: "top_rated");
    result.fold((failure) {
      emit(TopRatedSeriesFailure(failure.message));
    }, (series) {
      emit(TopRatedSeriesSuccess(series));
    });
  }
}

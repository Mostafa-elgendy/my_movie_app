import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/features/series_home/data/model/series_model.dart';
import 'package:my_movie_app/features/series_home/data/repos/home_series_repo.dart';

part 'popular_series_state.dart';

class PopularSeriesCubit extends Cubit<PopularSeriesState> {
  PopularSeriesCubit(this.homeSeriesRepo) : super(PopularSeriesInitial());
  final HomeSeriesRepo homeSeriesRepo;
  Future<void> fetchPopularSeries() async {
    emit(PopularSeriesLoading());
    var result = await homeSeriesRepo.fetchSeries(category: "popular");
    result.fold((failure) {
      emit(PopularSeriesFailure(failure.message));
    }, (series) {
      emit(PopularSeriesSuccess(series));
    });
  }
}

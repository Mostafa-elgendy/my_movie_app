import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/features/movies_home/data/repos/home_repo.dart';

part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  final HomeRepo homeRepo;
  TrendingMoviesCubit(this.homeRepo) : super(TrendingMoviesInitial());
  Future<void> fetchTrendingMovies() async {
    emit(TrendingMoviesLoading());
    var result = await homeRepo.fetchTrendingMovies();
    result.fold((failure) {
      emit(TrendingMoviesFailure(failure.message));
    }, (movies) {
      emit(TrendingMoviesSuccess(movies));
    });
  }
}

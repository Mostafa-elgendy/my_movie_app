import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/features/movies_home/data/repos/home_repo.dart';

part 'top_rated_movies_state.dart';

class TopRatedMovieCubit extends Cubit<TopRatedState> {
  TopRatedMovieCubit(this.homeRepo) : super(TopRatedMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    var result = await homeRepo.fetchMovies(category: "top_rated");
    result.fold((failure) {
      emit(TopRatedMoviesFailure(failure.message));
    }, (movies) {
      emit(TopRatedMoviesSuccess(movies));
    });
  }
}

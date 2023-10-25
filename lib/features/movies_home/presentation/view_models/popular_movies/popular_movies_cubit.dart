import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/features/movies_home/data/repos/home_repo.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.homeRepo) : super(PopularMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchPopularMovies() async {
    emit(PopularMoviesLoading());
    var result = await homeRepo.fetchMovies(category: "popular");
    result.fold((failure) {
      emit(PopularMoviesFailure(failure.message));
    }, (movies) {
      emit(PopularMoviesSuccess(movies));
    });
  }
}

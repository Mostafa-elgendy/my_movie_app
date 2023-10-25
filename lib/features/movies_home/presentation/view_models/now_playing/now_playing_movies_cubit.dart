import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/features/movies_home/data/repos/home_repo.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit(this.homeRepo) : super(NowPlayingMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    var result = await homeRepo.fetchMovies(category: "now_playing");
    result.fold((failure) {
      emit(NowPlayingMoviesFailure(failure.message));
    }, (movies) {
      emit(NowPlayingMoviesSuccess(movies));
    });
  }
}

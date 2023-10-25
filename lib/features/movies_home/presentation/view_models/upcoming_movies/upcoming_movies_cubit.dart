import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/features/movies_home/data/repos/home_repo.dart';

part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  UpcomingMoviesCubit(this.homeRepo) : super(UpcomingMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchUpcomingMovies() async {
    emit(UpcomingMoviesLoading());
    var result = await homeRepo.fetchMovies(category: "upcoming");
    result.fold((failure) {
      emit(UpcomingMoviesFailure(failure.message));
    }, (movies) {
      emit(UpcomingMoviesSuccess(movies));
    });
  }
}

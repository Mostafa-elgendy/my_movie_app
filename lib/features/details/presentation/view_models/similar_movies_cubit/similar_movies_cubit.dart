import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/features/details/data/repos/details_repo.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit({required this.detailsRepo})
      : super(SimilarMoviesInitial());
  final DetailsRepo detailsRepo;

  Future<void> fetchSimilarMovies(int movieId) async {
    emit(SimilarMoviesLoading());
    var result = await detailsRepo.fetchSimilarMovies(movieId: movieId);
    result.fold((failure) {
      emit(SimilarMoviesFailure(failure.message));
    }, (movies) {
      emit(SimilarMoviesSuccess(movies));
    });
  }
}

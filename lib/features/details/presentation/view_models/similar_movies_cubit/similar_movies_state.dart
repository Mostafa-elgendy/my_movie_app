part of 'similar_movies_cubit.dart';

abstract class SimilarMoviesState {}

class SimilarMoviesInitial extends SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesFailure extends SimilarMoviesState {
  final String errMessage;

  SimilarMoviesFailure(this.errMessage);
}

class SimilarMoviesSuccess extends SimilarMoviesState {
  final List<MovieModel> movies;

  SimilarMoviesSuccess(this.movies);
}

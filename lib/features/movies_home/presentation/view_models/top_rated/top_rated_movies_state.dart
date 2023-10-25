part of 'top_rated_movies_cubit.dart';

abstract class TopRatedState {}

class TopRatedMoviesInitial extends TopRatedState {}

class TopRatedMoviesLoading extends TopRatedState {}

class TopRatedMoviesFailure extends TopRatedState {
  final String errMessage;

  TopRatedMoviesFailure(this.errMessage);
}

class TopRatedMoviesSuccess extends TopRatedState {
  final List<MovieModel> movies;

  TopRatedMoviesSuccess(this.movies);
}

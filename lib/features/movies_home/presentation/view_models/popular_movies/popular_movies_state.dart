part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesFailure extends PopularMoviesState {
  final String errMessage;

  PopularMoviesFailure(this.errMessage);
}

class PopularMoviesSuccess extends PopularMoviesState {
  final List<MovieModel> movies;

  PopularMoviesSuccess(this.movies);
}

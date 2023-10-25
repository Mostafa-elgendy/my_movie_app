part of 'trending_movies_cubit.dart';

abstract class TrendingMoviesState {}

class TrendingMoviesInitial extends TrendingMoviesState {}

class TrendingMoviesLoading extends TrendingMoviesState {}

class TrendingMoviesFailure extends TrendingMoviesState {
  final String errMessage;

  TrendingMoviesFailure(this.errMessage);
}

class TrendingMoviesSuccess extends TrendingMoviesState {
  final List<MovieModel> movies;

  TrendingMoviesSuccess(this.movies);
}

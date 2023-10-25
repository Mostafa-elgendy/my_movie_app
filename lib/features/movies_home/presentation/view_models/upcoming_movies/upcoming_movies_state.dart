part of 'upcoming_movies_cubit.dart';

abstract class UpcomingMoviesState {}

class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoading extends UpcomingMoviesState {}

class UpcomingMoviesFailure extends UpcomingMoviesState {
  final String errMessage;

  UpcomingMoviesFailure(this.errMessage);
}

class UpcomingMoviesSuccess extends UpcomingMoviesState {
  final List<MovieModel> movies;

  UpcomingMoviesSuccess(this.movies);
}

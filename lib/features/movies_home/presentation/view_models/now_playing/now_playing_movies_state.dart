part of 'now_playing_movies_cubit.dart';

abstract class NowPlayingMoviesState {}

class NowPlayingMoviesInitial extends NowPlayingMoviesState {}

class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

class NowPlayingMoviesFailure extends NowPlayingMoviesState {
  final String errMessage;

  NowPlayingMoviesFailure(this.errMessage);
}

class NowPlayingMoviesSuccess extends NowPlayingMoviesState {
  final List<MovieModel> movies;

  NowPlayingMoviesSuccess(this.movies);
}

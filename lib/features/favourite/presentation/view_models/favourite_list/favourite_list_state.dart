part of 'favourite_list_cubit.dart';

abstract class FavouriteListState {}

class FavouriteListInitial extends FavouriteListState {}

class FavouriteListLoading extends FavouriteListState {}

class FavouriteListFailure extends FavouriteListState {
  final String errMessage;

  FavouriteListFailure(this.errMessage);
}

class FavouriteListSuccess extends FavouriteListState {
  final List<MovieModel> movies;

  FavouriteListSuccess(this.movies);
}

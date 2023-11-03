part of 'add_favourite_cubit.dart';

abstract class AddFavouriteState {}

class AddFavouriteInitial extends AddFavouriteState {}

class AddFavouriteLoading extends AddFavouriteState {}

class AddFavouriteFailure extends AddFavouriteState {
  final String errMessage;

  AddFavouriteFailure(this.errMessage);
}

class AddFavouriteSuccess extends AddFavouriteState {
  AddFavouriteSuccess();
}

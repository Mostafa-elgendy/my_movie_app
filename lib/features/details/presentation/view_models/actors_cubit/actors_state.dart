part of 'actors_cubit.dart';

abstract class ActorsState {}

class ActorsInitial extends ActorsState {}

class ActorsLoading extends ActorsState {}

class ActorsFailure extends ActorsState {
  final String errMessage;

  ActorsFailure(this.errMessage);
}

class ActorsSuccess extends ActorsState {
  final List<ActorModel> actors;
  ActorsSuccess(this.actors);
}

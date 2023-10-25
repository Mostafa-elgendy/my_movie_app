import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/features/details/data/models/actor_model.dart';
import 'package:my_movie_app/features/details/data/repos/details_repo.dart';

part 'actors_state.dart';

class ActorsCubit extends Cubit<ActorsState> {
  ActorsCubit({required this.detailsRepo}) : super(ActorsInitial());
  final DetailsRepo detailsRepo;

  Future<void> fetchMovieCast(int movieId) async {
    emit(ActorsLoading());
    var result = await detailsRepo.fetchMovieCast(movieId: movieId);
    result.fold((failure) {
      emit(ActorsFailure(failure.message));
    }, (actors) {
      emit(ActorsSuccess(actors));
    });
  }
}

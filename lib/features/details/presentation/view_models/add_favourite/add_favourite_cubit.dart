import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/features/details/data/repos/details_repo.dart';

part 'add_favourite_state.dart';

class AddFavouriteCubit extends Cubit<AddFavouriteState> {
  AddFavouriteCubit({required this.detailsRepo}) : super(AddFavouriteInitial());
  final DetailsRepo detailsRepo;

  Future<void> addToFavourite(MovieModel movieModel) async {
    emit(AddFavouriteLoading());
    var result = await detailsRepo.addToFavourite(movieModel: movieModel);
    result.fold((failure) {
      emit(AddFavouriteFailure(failure.message));
    }, (movie) {
      emit(AddFavouriteSuccess());
    });
  }
}

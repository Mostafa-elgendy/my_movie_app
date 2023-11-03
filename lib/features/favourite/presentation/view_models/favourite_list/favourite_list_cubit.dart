import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/features/favourite/data/repos/favourite_repo.dart';

part 'favourite_list_state.dart';

class FavouriteListCubit extends Cubit<FavouriteListState> {
  FavouriteListCubit({required this.favouriteRepo})
      : super(FavouriteListInitial());
  final FavouriteRepo favouriteRepo;

  Future<void> fetchFavouriteMovies() async {
    emit(FavouriteListInitial());
    var result = await favouriteRepo.fetchFavouriteMovies();
    result.fold((failure) {
      emit(FavouriteListFailure(failure.message));
    }, (movies) {
      emit(FavouriteListSuccess(movies));
    });
  }
}

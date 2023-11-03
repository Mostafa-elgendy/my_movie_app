import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_movie_app/core/utils/firebase_services.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_movie_app/features/favourite/data/repos/favourite_repo.dart';

class FavouriteRepoImpl extends FavouriteRepo {
  final FirebaseServices firebaseServices;

  FavouriteRepoImpl(this.firebaseServices);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchFavouriteMovies() async {
    try {
      List<MovieModel> movies = await firebaseServices.getFavourite();
      return right(movies);
    } on Exception catch (e) {
      if (e is FirebaseException) {
        return left(FirebaseFailure(e.message.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

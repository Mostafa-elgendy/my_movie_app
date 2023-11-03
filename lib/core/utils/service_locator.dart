import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_app/core/utils/api_movie_services.dart';
import 'package:my_movie_app/core/utils/api_series_services.dart';
import 'package:my_movie_app/core/utils/firebase_services.dart';
import 'package:my_movie_app/features/details/data/repos/details_repo_impl.dart';
import 'package:my_movie_app/features/favourite/data/repos/favourite_repo_impl.dart';
import 'package:my_movie_app/features/movies_home/data/repos/home_repo_impl.dart';
import 'package:my_movie_app/features/series_home/data/repos/home_series_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiMoviesService>(ApiMoviesService(
    Dio(),
  ));

  getIt.registerSingleton<ApiSeriesService>(ApiSeriesService(
    Dio(),
  ));

  getIt.registerSingleton<FirebaseServices>(
    FirebaseServices(),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(getIt.get<ApiMoviesService>()),
  );
  getIt.registerSingleton<HomeSeriesRepoImpl>(
    HomeSeriesRepoImpl(getIt.get<ApiSeriesService>()),
  );
  getIt.registerSingleton<DetailsRepoImpl>(
    DetailsRepoImpl(
      getIt.get<ApiMoviesService>(),
      getIt.get<FirebaseServices>(),
    ),
  );
  getIt.registerSingleton<FavouriteRepoImpl>(
    FavouriteRepoImpl(
      getIt.get<FirebaseServices>(),
    ),
  );
}

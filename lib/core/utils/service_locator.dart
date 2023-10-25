import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_app/core/utils/api_services.dart';
import 'package:my_movie_app/features/details/data/repos/details_repo_impl.dart';
import 'package:my_movie_app/features/movies_home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(
    Dio(),
  ));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<DetailsRepoImpl>(
    DetailsRepoImpl(getIt.get<ApiService>()),
  );
}

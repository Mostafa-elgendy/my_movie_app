import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:my_movie_app/core/utils/app_router.dart';
import 'package:my_movie_app/core/utils/constants.dart';
import 'package:my_movie_app/core/utils/service_locator.dart';
import 'package:my_movie_app/features/login/data/repos/login_repo_impl.dart';
import 'package:my_movie_app/features/login/presentation/view_models/login_cubit/user_login_cubit.dart';
import 'package:my_movie_app/features/movies_home/data/repos/home_repo_impl.dart';
import 'package:my_movie_app/features/movies_home/presentation/view_models/now_playing/now_playing_movies_cubit.dart';
import 'package:my_movie_app/features/movies_home/presentation/view_models/popular_movies/popular_movies_cubit.dart';
import 'package:my_movie_app/features/movies_home/presentation/view_models/top_rated/top_rated_movies_cubit.dart';
import 'package:my_movie_app/features/movies_home/presentation/view_models/trending_movies/trending_movies_cubit.dart';
import 'package:my_movie_app/features/movies_home/presentation/view_models/upcoming_movies/upcoming_movies_cubit.dart';
import 'package:my_movie_app/features/register/data/repos/register_repo_impl.dart';
import 'package:my_movie_app/features/register/presentation/view_models/register_cubit/register_user_cubit.dart';
import 'package:my_movie_app/firebase_options.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserLoginCubit(loginRepo: LoginRepoImpl()),
        ),
        BlocProvider(
          create: (context) =>
              RegisterUserCubit(registerRepo: RegisterRepoImpl()),
        ),
        BlocProvider(
          create: (context) => TrendingMoviesCubit(getIt.get<HomeRepoImpl>())
            ..fetchTrendingMovies(),
        ),
        BlocProvider(
          create: (context) => TopRatedMovieCubit(getIt.get<HomeRepoImpl>())
            ..fetchTopRatedMovies(),
        ),
        BlocProvider(
          create: (context) => UpcomingMoviesCubit(getIt.get<HomeRepoImpl>())
            ..fetchUpcomingMovies(),
        ),
        BlocProvider(
          create: (context) => PopularMoviesCubit(getIt.get<HomeRepoImpl>())
            ..fetchPopularMovies(),
        ),
        BlocProvider(
          create: (context) => NowPlayingMoviesCubit(getIt.get<HomeRepoImpl>())
            ..fetchNowPlayingMovies(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        builder: EasyLoading.init(),
        theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

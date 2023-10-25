import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/core/utils/service_locator.dart';
import 'package:my_movie_app/features/details/data/repos/details_repo_impl.dart';
import 'package:my_movie_app/features/details/presentation/view_models/actors_cubit/actors_cubit.dart';
import 'package:my_movie_app/features/details/presentation/view_models/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:my_movie_app/features/details/presentation/views/details_view.dart';
import 'package:my_movie_app/features/home/presentation/views/home_view.dart';
import 'package:my_movie_app/features/login/presentation/views/login_view.dart';
import 'package:my_movie_app/features/movies_home/presentation/views/movies_home_view.dart';
import 'package:my_movie_app/features/register/presentation/views/register_view.dart';
import 'package:my_movie_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kMoviesHomeView = "/moviesHomeView";
  static const kMovieDetailsView = '/movieDetailsView';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kMoviesHomeView,
        builder: (context, state) => const MoviesHomeView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
          path: kMovieDetailsView,
          builder: (context, state) {
            MovieModel movieModel = state.extra as MovieModel;

            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SimilarMoviesCubit(
                    detailsRepo: getIt.get<DetailsRepoImpl>(),
                  )..fetchSimilarMovies(movieModel.id),
                ),
                BlocProvider(
                  create: (context) => ActorsCubit(
                    detailsRepo: getIt.get<DetailsRepoImpl>(),
                  )..fetchMovieCast(movieModel.id),
                )
              ],
              child: DetailsView(
                movieModel: state.extra as MovieModel,
              ),
            );
            /* return DetailsView(
              movieModel: state.extra as MovieModel,
            );*/
          }),

      /* GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),*/
    ],
  );
}

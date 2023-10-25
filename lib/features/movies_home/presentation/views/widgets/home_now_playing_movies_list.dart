import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/widgets/custom_error_widget.dart';
import 'package:my_movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_movie_app/features/movies_home/presentation/view_models/now_playing/now_playing_movies_cubit.dart';
import 'package:my_movie_app/features/movies_home/presentation/views/widgets/home_now_playing_movie_item.dart';

class HomeNowPlayingMoviesList extends StatelessWidget {
  const HomeNowPlayingMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
      builder: (context, state) {
        if (state is NowPlayingMoviesSuccess) {
          return SizedBox(
            width: double.infinity,
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:
                      HomeNowPlayingMovieItem(movieModel: state.movies[index]),
                );
              },
            ),
          );
        } else if (state is NowPlayingMoviesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

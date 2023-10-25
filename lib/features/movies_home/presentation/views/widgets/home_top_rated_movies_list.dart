import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/widgets/custom_error_widget.dart';
import 'package:my_movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_movie_app/features/movies_home/presentation/view_models/top_rated/top_rated_movies_cubit.dart';
import 'package:my_movie_app/features/movies_home/presentation/views/widgets/home_top_rated_movie_item.dart';

class HomeTopRatedMoviesList extends StatelessWidget {
  const HomeTopRatedMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMovieCubit, TopRatedState>(
      builder: (context, state) {
        if (state is TopRatedMoviesSuccess) {
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
                  child: HomeTopRatedMovieItem(movieModel: state.movies[index]),
                );
              },
            ),
          );
        } else if (state is TopRatedMoviesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_movie_app/features/home/presentation/views/widgets/home_view_actors.dart';
import 'package:my_movie_app/features/home/presentation/views/widgets/home_view_favourite.dart';
import 'package:my_movie_app/features/home/presentation/views/widgets/home_view_movies.dart';
import 'package:my_movie_app/features/home/presentation/views/widgets/home_view_series.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              HomeViewMovies(),
              HomeViewSeries(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              HomeViewActors(),
              HomeViewFavourite(),
            ],
          ),
        ],
      ),
    );
  }
}

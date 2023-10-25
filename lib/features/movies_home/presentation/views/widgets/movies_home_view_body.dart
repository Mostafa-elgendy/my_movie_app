import 'package:flutter/material.dart';
import 'package:my_movie_app/core/utils/styles.dart';
import 'package:my_movie_app/features/movies_home/presentation/views/widgets/home_now_playing_movies_list.dart';
import 'package:my_movie_app/features/movies_home/presentation/views/widgets/home_popular_movies_list.dart';
import 'package:my_movie_app/features/movies_home/presentation/views/widgets/home_top_rated_movies_list.dart';
import 'package:my_movie_app/features/movies_home/presentation/views/widgets/home_trending_movies.dart';
import 'package:my_movie_app/features/movies_home/presentation/views/widgets/home_upcoming_movies_list.dart';
import 'package:my_movie_app/features/movies_home/presentation/views/widgets/movie_app_bar.dart';

class MoviesHomeViewBody extends StatelessWidget {
  const MoviesHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MovieAppBar(),
            const SizedBox(
              height: 10,
            ),
            trendingMovies(),
            const SizedBox(
              height: 10,
            ),
            topRated(),
            const SizedBox(
              height: 10,
            ),
            upcoming(),
            const SizedBox(
              height: 10,
            ),
            popular(),
            const SizedBox(
              height: 10,
            ),
            nowPlaying(),
          ],
        ),
      ),
    );
  }

  Widget trendingMovies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Trending Movies",
          textAlign: TextAlign.start,
          style: Styles.textStyle18,
        ),
        SizedBox(
          height: 10,
        ),
        HomeTrendingList(),
      ],
    );
  }

  Widget topRated() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Top Rated Movies',
          textAlign: TextAlign.start,
          style: Styles.textStyle18,
        ),
        SizedBox(
          width: double.infinity,
          height: 150,
          child: HomeTopRatedMoviesList(),
        ),
      ],
    );
  }

  Widget upcoming() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Upcoming Movies',
          textAlign: TextAlign.start,
          style: Styles.textStyle18,
        ),
        SizedBox(
          width: double.infinity,
          height: 150,
          child: HomeUpcomingMoviesList(),
        ),
      ],
    );
  }

  Widget popular() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Popular',
          textAlign: TextAlign.start,
          style: Styles.textStyle18,
        ),
        SizedBox(
          width: double.infinity,
          height: 150,
          child: HomePopularMoviesList(),
        ),
      ],
    );
  }

  Widget nowPlaying() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Now Playing',
          textAlign: TextAlign.start,
          style: Styles.textStyle18,
        ),
        SizedBox(
          width: double.infinity,
          height: 150,
          child: HomeNowPlayingMoviesList(),
        ),
      ],
    );
  }
}

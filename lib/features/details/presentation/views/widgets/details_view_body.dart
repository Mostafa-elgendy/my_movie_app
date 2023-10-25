import 'package:flutter/material.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/core/utils/styles.dart';
import 'package:my_movie_app/features/details/presentation/views/widgets/details_movie_cast_list.dart';
import 'package:my_movie_app/features/details/presentation/views/widgets/details_movie_overview.dart';
import 'package:my_movie_app/features/details/presentation/views/widgets/details_similar_movies_list.dart';
import 'package:my_movie_app/features/details/presentation/views/widgets/details_view_movie_poster.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DetailsViewMoviePoster(
            posterPath: movieModel.posterPath!,
          ),
          DetailsMovieOverview(overview: movieModel.overview),
          const SizedBox(height: 10.0),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Cast',
              style: Styles.textStyle18,
            ),
          ),
          const DetailsMoviesCastList(),
          const SizedBox(height: 10.0),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Similar movies',
              style: Styles.textStyle18,
            ),
          ),
          const DetailsSimilarMoviesList(),
        ],
      ),
    );
  }
}

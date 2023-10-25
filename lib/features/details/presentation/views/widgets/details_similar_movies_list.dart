import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/widgets/custom_error_widget.dart';
import 'package:my_movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_movie_app/features/details/presentation/view_models/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:my_movie_app/features/details/presentation/views/widgets/details_similar_movie_item.dart';

class DetailsSimilarMoviesList extends StatelessWidget {
  const DetailsSimilarMoviesList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
      builder: (context, state) {
        if (state is SimilarMoviesSuccess) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: DetailsSimilarMovieItem(
                          movieModel: state.movies[index]),
                    );
                  },
                ),
              )
            ],
          );
        } else if (state is SimilarMoviesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/widgets/custom_error_widget.dart';
import 'package:my_movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_movie_app/features/movies_home/presentation/view_models/trending_movies/trending_movies_cubit.dart';
import 'package:my_movie_app/features/movies_home/presentation/views/widgets/home_trending_movie_item.dart';

class HomeTrendingList extends StatelessWidget {
  const HomeTrendingList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
      builder: (context, state) {
        if (state is TrendingMoviesSuccess) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index, realIndex) {
                    //    print(movies[index].posterPath);
                    return HomeTrendingMovieItem(
                      movieModel: state.movies[index],
                    );
                  },
                  options: CarouselOptions(
                      //    autoPlayInterval: Duration(seconds: 2),
                      enlargeCenterPage: true,
                      viewportFraction: 0.40,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlay: true,
                      height: 200),
                ),
              ));
        } else if (state is TrendingMoviesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

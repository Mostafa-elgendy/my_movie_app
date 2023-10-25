import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_app/core/utils/app_router.dart';
import 'package:my_movie_app/core/utils/assets.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';

class HomeUpcomingMovieItem extends StatelessWidget {
  const HomeUpcomingMovieItem({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kMovieDetailsView, extra: movieModel);
      },
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: movieModel.posterPath ??= AssetsData.testImage,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) {
            return const Icon(
              Icons.error_outline_rounded,
              size: 50,
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}

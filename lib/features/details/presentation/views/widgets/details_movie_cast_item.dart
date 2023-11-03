import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_app/core/utils/app_router.dart';
import 'package:my_movie_app/features/details/data/models/actor_model.dart';

class DetailsMovieCastItem extends StatelessWidget {
  const DetailsMovieCastItem({super.key, required this.actorModel});
  final ActorModel actorModel;

  // final MovieModel? movieModel;
  // String? posterPath = null;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kMovieDetailsView);
      },
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: actorModel.profilePath!,
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_app/core/utils/app_router.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/core/utils/styles.dart';
import 'package:my_movie_app/features/favourite/presentation/views/widgets/movie_rating.dart';

class FavouriteListViewItem extends StatelessWidget {
  const FavouriteListViewItem({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kMovieDetailsView, extra: movieModel);
      },
      child: SizedBox(
        height: 100,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.grey[300],
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                itemImage(),
                const SizedBox(
                  width: 20,
                ),
                itemDetails(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded itemDetails(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              movieModel.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movieModel.releaseDate!,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle14.copyWith(color: Colors.grey.shade400),
          ),
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Text(
                  "Free",
                  style:
                      Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  " ",
                  style:
                      Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 1,
                ),
                const MovieRating(
                  rating: 20,
                  count: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AspectRatio itemImage() {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: movieModel.posterPath!,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

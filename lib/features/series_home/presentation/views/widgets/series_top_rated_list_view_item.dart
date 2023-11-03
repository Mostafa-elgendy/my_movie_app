import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/core/utils/assets.dart';
import 'package:my_movie_app/core/utils/styles.dart';
import 'package:my_movie_app/features/series_home/data/model/series_model.dart';
import 'package:my_movie_app/features/series_home/presentation/views/widgets/series_rating.dart';

class SeriesTopRatedListViewItem extends StatelessWidget {
  const SeriesTopRatedListViewItem({super.key, required this.seriesModel});
  final SeriesModel seriesModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
              seriesModel.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            seriesModel.firstAirDate!,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle14.copyWith(color: Colors.grey.shade700),
          ),
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Text(
                  seriesModel.originalLanguage!,
                  style:
                      Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  " -  ${seriesModel.originCountry}",
                  style:
                      Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 1,
                ),
                SeriesRating(
                  rating: seriesModel.voteAverage!,
                  count: seriesModel.voteCount!,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AspectRatio itemImage() {
    // print("path: ${seriesModel.posterPath}");
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: seriesModel.posterPath ??= AssetsData.testImage,
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

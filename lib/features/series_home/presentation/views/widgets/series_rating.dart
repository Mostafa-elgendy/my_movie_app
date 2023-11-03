import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_movie_app/core/utils/constants.dart';
import 'package:my_movie_app/core/utils/styles.dart';

class SeriesRating extends StatelessWidget {
  const SeriesRating({super.key, required this.rating, required this.count});
  final double rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: kIconColor,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          "$rating",
          style: Styles.textStyle14,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          "  -  $count",
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}

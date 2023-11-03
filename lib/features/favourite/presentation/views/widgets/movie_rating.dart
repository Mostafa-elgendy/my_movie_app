import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_movie_app/core/utils/styles.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({super.key, required this.rating, required this.count});
  final int rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
        ),
        SizedBox(
          width: 6.3,
        ),
        Text(
          "12.99",
          style: Styles.textStyle14,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          "(245)",
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}

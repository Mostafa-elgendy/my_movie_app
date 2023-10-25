import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_movie_app/core/utils/styles.dart';

class DetailsMovieOverview extends StatelessWidget {
  const DetailsMovieOverview({super.key, required this.overview});
  final String overview;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Text(
          overview,
          style: Styles.textStyle18,
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              FontAwesomeIcons.check,
              size: 25.0,
            ),
            Icon(
              FontAwesomeIcons.shareNodes,
              size: 25.0,
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('My List'),
            Text('Share'),
          ],
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

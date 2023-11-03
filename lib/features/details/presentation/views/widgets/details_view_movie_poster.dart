import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/core/utils/styles.dart';

class DetailsViewMoviePoster extends StatelessWidget {
  const DetailsViewMoviePoster({
    super.key,
    required this.posterPath,
    required this.title,
  });
  final String posterPath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 400,
              child: CachedNetworkImage(
                // imageUrl: "https://image.tmdb.org/t/p/w500/qVKirUdmoex8SdfUk8WDDWwrcCh.jpg",
                imageUrl: posterPath,
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
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

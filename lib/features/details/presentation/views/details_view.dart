import 'package:flutter/material.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/features/details/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: DetailsViewBody(
            movieModel: movieModel,
          ),
        ),
      ),
    );
  }
}

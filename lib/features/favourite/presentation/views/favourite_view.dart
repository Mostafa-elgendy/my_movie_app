import 'package:flutter/material.dart';
import 'package:my_movie_app/features/favourite/presentation/views/widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: FavouriteViewBody(),
        ),
      ),
    );
  }
}

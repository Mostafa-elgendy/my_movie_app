import 'package:flutter/material.dart';
import 'package:my_movie_app/features/movies_home/presentation/views/widgets/movies_home_view_body.dart';

class MoviesHomeView extends StatelessWidget {
  const MoviesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: MoviesHomeViewBody(),
        ),
      ),
    );
  }
}

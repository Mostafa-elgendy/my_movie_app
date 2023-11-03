import 'package:flutter/material.dart';
import 'package:my_movie_app/features/series_home/presentation/views/widgets/series_home_view_body.dart';

class SeriesHomeView extends StatelessWidget {
  const SeriesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SeriesHomeViewBody(),
      ),
    );
  }
}

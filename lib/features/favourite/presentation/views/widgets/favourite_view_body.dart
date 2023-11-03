import 'package:flutter/material.dart';
import 'package:my_movie_app/core/widgets/movie_app_bar.dart';
import 'package:my_movie_app/features/favourite/presentation/views/widgets/favourite_list_view.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              MovieAppBar(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: FavouriteListView(),
        )
      ],
    );
  }
}

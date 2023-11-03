import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/widgets/custom_error_widget.dart';
import 'package:my_movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_movie_app/features/favourite/presentation/view_models/favourite_list/favourite_list_cubit.dart';
import 'package:my_movie_app/features/favourite/presentation/views/widgets/favourite_list_view_item.dart';

class FavouriteListView extends StatelessWidget {
  const FavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteListCubit, FavouriteListState>(
      builder: (context, state) {
        if (state is FavouriteListSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: FavouriteListViewItem(
                  movieModel: state.movies[index],
                ),
              );
            },
          );
        } else if (state is FavouriteListFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

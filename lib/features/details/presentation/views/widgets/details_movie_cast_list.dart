import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/widgets/custom_error_widget.dart';
import 'package:my_movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_movie_app/features/details/presentation/view_models/actors_cubit/actors_cubit.dart';
import 'package:my_movie_app/features/details/presentation/views/widgets/details_movie_cast_item.dart';

class DetailsMoviesCastList extends StatelessWidget {
  const DetailsMoviesCastList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorsCubit, ActorsState>(
      builder: (context, state) {
        if (state is ActorsSuccess) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.actors.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          DetailsMovieCastItem(actorModel: state.actors[index]),
                    );
                  },
                ),
              )
            ],
          );
        } else if (state is ActorsFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

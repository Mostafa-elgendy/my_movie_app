import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';
import 'package:my_movie_app/core/utils/styles.dart';
import 'package:my_movie_app/features/details/presentation/view_models/add_favourite/add_favourite_cubit.dart';

class DetailsMovieOverview extends StatelessWidget {
  const DetailsMovieOverview({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFavouriteCubit, AddFavouriteState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Text(
                movieModel.overview,
                style: Styles.textStyle18,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AddFavouriteCubit>(context)
                          .addToFavourite(movieModel);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.heart,
                      size: 25.0,
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.shareNodes,
                    size: 25.0,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('Add to List'),
                  Text('Share'),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is AddFavouriteSuccess) {
          //dialog
          Navigator.pop(context);
        } else if (state is AddFavouriteFailure) {
          //dialog error
          //  print(state.errMessage);
        } else {
          // dialog loading
          // print("loading");
          showLoaderDialog(context);
        }
      },
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

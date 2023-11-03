import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_app/core/utils/app_router.dart';
import 'package:my_movie_app/core/utils/styles.dart';

class HomeViewEditProfile extends StatelessWidget {
  const HomeViewEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kFavouriteView);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
        ),
        margin: const EdgeInsets.all(5),
        height: 180,
        width: 180,
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            'Edit Profile',
            textAlign: TextAlign.center,
            style: Styles.textStyle18.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

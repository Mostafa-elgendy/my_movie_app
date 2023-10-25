import 'package:flutter/material.dart';
import 'package:my_movie_app/core/utils/assets.dart';
import 'package:my_movie_app/core/utils/styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              AssetsData.logo,
              width: 150,
              height: 150,
              //color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Welcome to Movie App',
            textAlign: TextAlign.center,
            style: Styles.textStyle14.copyWith(color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}

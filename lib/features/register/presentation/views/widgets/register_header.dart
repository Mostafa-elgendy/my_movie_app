import 'package:flutter/material.dart';
import 'package:my_movie_app/core/utils/assets.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

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
        ],
      ),
    );
  }
}

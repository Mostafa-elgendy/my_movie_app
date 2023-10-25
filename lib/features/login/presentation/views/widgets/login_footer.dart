import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_app/core/utils/app_router.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          showDivider(),
          showRegister(context),
        ],
      ),
    );
  }

  Row showRegister(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Not a member'),
        const SizedBox(
          width: 5,
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kRegisterView);
          },
          child: const Text(
            'Register now',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Padding showDivider() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            thickness: 3,
            color: Colors.grey.shade300,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Or ',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          Expanded(
              child: Divider(
            thickness: 3,
            color: Colors.grey.shade300,
          )),
        ],
      ),
    );
  }
}

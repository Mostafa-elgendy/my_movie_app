import 'package:flutter/material.dart';
import 'package:my_movie_app/features/register/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: RegisterViewBody()),
      ),
    );
  }
}

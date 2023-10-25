import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_app/core/utils/app_router.dart';
import 'package:my_movie_app/core/utils/styles.dart';
import 'package:my_movie_app/core/widgets/mybutton.dart';
import 'package:my_movie_app/core/widgets/mytextfield.dart';
import 'package:my_movie_app/features/login/presentation/view_models/login_cubit/user_login_cubit.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key, required this.errMessage});
  final formKey = GlobalKey<FormState>();
  final emailcontroler = TextEditingController();
  final passwordcontroler = TextEditingController();
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    errMessage,
                    style: Styles.textErrorStyle14,
                  ),
                ),
              ),
              MyTextField(
                  controler: emailcontroler,
                  hinttext: 'Email',
                  obsecuretext: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controler: passwordcontroler,
                  hinttext: 'Password',
                  obsecuretext: true),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                title: 'Login',
                ontap: () => {
                  if (formKey.currentState!.validate())
                    {
                      Println("Enter"),
                      BlocProvider.of<UserLoginCubit>(context).userLogin(
                          email: emailcontroler.text,
                          password: passwordcontroler.text),
                    },
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MyButton(
          title: 'Enter as a guest',
          ontap: () => {
            GoRouter.of(context).push(
              AppRouter.kHomeView,
            ),
          },
        ),
      ],
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/utils/styles.dart';
import 'package:my_movie_app/core/widgets/mybutton.dart';
import 'package:my_movie_app/core/widgets/mytextfield.dart';
import 'package:my_movie_app/features/register/presentation/view_models/register_cubit/register_user_cubit.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key, required this.errMessage});
  final formKey = GlobalKey<FormState>();
  final usercontroler = TextEditingController();

  final passwordcontroler = TextEditingController();

  final emailcontroler = TextEditingController();

  final passwordConfirmcontroler = TextEditingController();
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
                  controler: usercontroler,
                  hinttext: 'user name',
                  obsecuretext: false),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controler: emailcontroler,
                  hinttext: 'email',
                  obsecuretext: false),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controler: passwordcontroler,
                  hinttext: 'password',
                  obsecuretext: true),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controler: passwordcontroler,
                  hinttext: 'confirm password',
                  obsecuretext: true),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                  title: 'Signup',
                  ontap: () => {
                        if (formKey.currentState!.validate())
                          {
                            Println("Enter"),
                            BlocProvider.of<RegisterUserCubit>(context)
                                .registerUser(
                              email: emailcontroler.text,
                              password: passwordcontroler.text,
                              name: usercontroler.text,
                            ),
                          }
                      }),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

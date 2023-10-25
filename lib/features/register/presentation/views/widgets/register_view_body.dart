import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_app/core/utils/app_router.dart';
import 'package:my_movie_app/features/register/presentation/view_models/register_cubit/register_user_cubit.dart';
import 'package:my_movie_app/features/register/presentation/views/widgets/register_footer.dart';
import 'package:my_movie_app/features/register/presentation/views/widgets/register_form.dart';
import 'package:my_movie_app/features/register/presentation/views/widgets/register_header.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterUserCubit, RegisterUserState>(
        listener: (context, state) {
      if (state is RegisterUserSuccess) {
        EasyLoading.dismiss();
        GoRouter.of(context).push(AppRouter.kHomeView, extra: state.user);
      }
    }, child: BlocBuilder<RegisterUserCubit, RegisterUserState>(
      builder: (context, state) {
        if (state is RegisterUserFailure) {
          EasyLoading.dismiss();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RegisterHeader(),
              const SizedBox(
                height: 30,
              ),
              RegisterForm(
                errMessage: state.errMessage,
              ),
              const RegisterFooter(),
            ],
          );
        } else if (state is RegisterUserLoading) {
          EasyLoading.show(status: 'loading...');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RegisterHeader(),
              const SizedBox(
                height: 30,
              ),
              RegisterForm(
                errMessage: "",
              ),
              const RegisterFooter(),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RegisterHeader(),
              const SizedBox(
                height: 30,
              ),
              RegisterForm(
                errMessage: "",
              ),
              const RegisterFooter(),
            ],
          );
        }
      },
    ));
  }
}

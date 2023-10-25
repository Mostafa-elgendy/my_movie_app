import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_app/core/utils/app_router.dart';
import 'package:my_movie_app/features/login/presentation/view_models/login_cubit/user_login_cubit.dart';
import 'package:my_movie_app/features/login/presentation/views/widgets/login_footer.dart';
import 'package:my_movie_app/features/login/presentation/views/widgets/login_form.dart';
import 'package:my_movie_app/features/login/presentation/views/widgets/login_header.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserLoginCubit, UserLoginState>(
        listener: (context, state) {
      if (state is UserLoginSuccess) {
        EasyLoading.dismiss();
        GoRouter.of(context).push(AppRouter.kHomeView, extra: state.user);
      }
    }, child: BlocBuilder<UserLoginCubit, UserLoginState>(
      builder: (context, state) {
        if (state is UserLoginFailure) {
          EasyLoading.dismiss();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoginHeader(),
              const SizedBox(
                height: 30,
              ),
              LoginForm(
                errMessage: state.errMessage,
              ),
              const LoginFooter(),
            ],
          );
        } else if (state is UserLoginLoading) {
          EasyLoading.show(status: 'loading...');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoginHeader(),
              const SizedBox(
                height: 30,
              ),
              LoginForm(
                errMessage: "",
              ),
              const LoginFooter(),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoginHeader(),
              const SizedBox(
                height: 30,
              ),
              LoginForm(
                errMessage: "",
              ),
              const LoginFooter(),
            ],
          );
        }
      },
    ));
  }
}

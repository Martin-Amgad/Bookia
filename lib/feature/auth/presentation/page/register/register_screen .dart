import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/extentions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have an account? ', style: TextStyles.getSize16()),
            TextButton(
              onPressed: () {
                pushWithReplacement(context, Routes.login);
              },
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text(
                ' Login Now',
                style: TextStyles.getSize16(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            pop(context);
          },
          child: Image.asset(AppAssets.arrowBack, width: 41, height: 41),
        ),
      ),
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: _blockListener,
          child: _signUpBody(cubit, context),
        ),
      ),
    );
  }

  void _blockListener(BuildContext context, AuthState state) {
    if (state is AuthSuccessState) {
      pop(context);
      pushAndRemoveUntil(context, Routes.mainScreen);
    } else if (state is AuthErrorState) {
      pop(context);
      showerrordialoge(context, state.error);
    } else {
      showLoadingDialog(context);
    }
  }

  Padding _signUpBody(AuthCubit cubit, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Form(
        key: cubit.formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello! Register to get started',
                style: TextStyles.getSize30(),
              ),
              Gap(30),
              CustomTextField(
                controller: cubit.usernamController,
                hintText: 'Username',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter username';
                  }
                  return null;
                },
              ),
              Gap(15),
              CustomTextField(
                controller: cubit.emailController,
                hintText: '   Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter Email';
                  }
                  return null;
                },
              ),
              Gap(15),
              CustomTextField(
                controller: cubit.passwordController,
                hintText: 'Password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  } else if (value !=
                      cubit.passwordConfirmationController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              Gap(15),
              CustomTextField(
                controller: cubit.passwordConfirmationController,
                hintText: 'Confirm Password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  } else if (value != cubit.passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              Gap(30),
              MainButton(
                title: 'Register',
                onPressed: () {
                  if (cubit.formkey.currentState!.validate()) {
                    cubit.register();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

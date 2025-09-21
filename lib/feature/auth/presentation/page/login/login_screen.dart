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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return Scaffold(
      bottomNavigationBar: _goToSignUp(context),
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            pushWithReplacement(context, Routes.welcome);
          },
          child: Image.asset(AppAssets.arrowBack, width: 41, height: 41),
        ),
      ),
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: _blockListener,
          child: _LoginBody(cubit, context),
        ),
      ),
    );
  }

  SafeArea _goToSignUp(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don’t have an account?', style: TextStyles.getSize16()),
          TextButton(
            onPressed: () {
              pushWithReplacement(context, Routes.register);
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              ' Register Now',
              style: TextStyles.getSize16(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Padding _LoginBody(AuthCubit cubit, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Form(
        key: cubit.formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back! Glad \n to see you, Again',
                style: TextStyles.getSize30(),
              ),
              Gap(30),
              CustomTextField(
                controller: cubit.emailController,
                hintText: 'Enter Your Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter Email';
                  }
                },
              ),
              Gap(15),
              CustomTextField(
                controller: cubit.passwordController,
                hintText: 'Enter Your Password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      pushTo(context, Routes.emailScreen);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.getSize16(),
                    ),
                  ),
                ],
              ),
              Gap(30),
              MainButton(
                title: 'Login',
                onPressed: () {
                  if (cubit.formkey.currentState!.validate()) {
                    cubit.login();
                  }
                },
              ),
              Gap(35),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Text(
                    ' or Login with ',
                    style: TextStyles.getSize16(
                      fontSize: 14,
                      color: AppColors.darkgreyColor,
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              Gap(20),
              Row(
                spacing: 8,
                children: [
                  SocialButton(iconPath: AppAssets.googleSvg, onTap: () {}),
                  SocialButton(iconPath: AppAssets.facebookSvg, onTap: () {}),
                  SocialButton(iconPath: AppAssets.appleSvg, onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
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

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.iconPath, required this.onTap});
  final String iconPath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: SvgPicture.asset(iconPath)),
        ),
      ),
    );
  }
}

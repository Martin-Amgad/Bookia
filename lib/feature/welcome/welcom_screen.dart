import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/feature/auth/presentation/page/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.welcome,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 22,
            right: 22,
            top: 0,
            bottom: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                SvgPicture.asset(AppAssets.logoSvg),
                Gap(15),
                Text('Order Your Book Now!', style: TextStyles.getSize18()),
                Spacer(flex: 3),
                MainButton(
                  title: 'Login',
                  onPressed: () {
                    pushTo(context, Routes.login);
                  },
                ),
                Gap(15),
                MainButton(
                  title: 'Register',
                  onPressed: () {
                    pushTo(context, Routes.register);
                  },
                  bgcolor: AppColors.whiteColor,
                  textColor: Colors.black,
                  borderColor: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

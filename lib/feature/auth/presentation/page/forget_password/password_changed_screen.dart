import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.confirmSvg),
              Gap(35),
              Text('Password Changed!', style: TextStyles.getSize24()),
              Gap(5),
              Text(
                'Your password has been changed \n successfully.',
                textAlign: TextAlign.center,
                style: TextStyles.getSize16(color: AppColors.greyColor),
              ),
              Gap(40),
              MainButton(
                title: 'Back to Login',
                onPressed: () {
                  pushAndRemoveUntil(context, Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

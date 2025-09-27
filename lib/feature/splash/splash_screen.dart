import 'dart:developer';

import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/feature/welcome/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/routes/navigation.dart';

import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      log('${LocalHelper.getUserData()?.token}');
      if (LocalHelper.getUserData() != null) {
        pushWithReplacement(context, Routes.mainScreen);
      } else {
        pushWithReplacement(context, Routes.welcome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.logoSvg),
            Gap(10),
            Text('Order Your Book Now!', style: TextStyles.getSize18()),
          ],
        ),
      ),
    );
  }
}

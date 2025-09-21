import 'package:bookia/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:lottie/lottie.dart';

showerrordialoge(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      backgroundColor: AppColors.primaryColor,
      content: Text(message),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Center(child: Lottie.asset(AppAssets.loadingJson)),
  );
}

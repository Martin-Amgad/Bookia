import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:bookia/core/utils/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 55,
    this.fontSize = 16,
    this.bgcolor = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    this.borderColor,
  });
  final String title;
  final Function() onPressed;
  final double width;
  final double height;
  final double fontSize;
  final Color bgcolor;
  final Color textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: bgcolor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: TextStyles.getSize16(color: textColor, fontSize: fontSize),
        ),
      ),
    );
  }
}

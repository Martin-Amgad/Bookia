import 'package:bookia/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isobscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword && isobscure,

      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? Padding(
                padding: EdgeInsetsGeometry.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isobscure = !isobscure;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [SvgPicture.asset(AppAssets.eyeSvg)],
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

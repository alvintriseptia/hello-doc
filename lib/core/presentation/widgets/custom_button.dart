import 'package:flutter/material.dart';
import 'package:hello_doc/core/preferences/preferences.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final EdgeInsets margin;
  final void Function() onPressed;
  const CustomButton(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      this.margin = EdgeInsets.zero,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          primary: AppColors.primaryBlue,
          textStyle: Fonts.buttonText,
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
    ;
  }
}

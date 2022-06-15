import 'package:flutter/material.dart';
import 'package:hello_doc/core/preferences/preferences.dart';

class TxtFormField extends StatelessWidget {
  final String hintText;
  final String label;
  const TxtFormField({Key? key, required this.hintText, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Dimens.dp20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Fonts.heading2,
          ),
          const SizedBox(
            height: Dimens.dp16,
          ),
          TextFormField(
              cursorColor: AppColors.primaryBlue,
              decoration: InputDecoration(
                hintText: hintText,
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hello_doc/core/preferences/preferences.dart';

class PasswordFormField extends StatefulWidget {
  final String hintText;

  const PasswordFormField({Key? key, this.hintText = 'Password'})
      : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Dimens.dp20),
      child: TextFormField(
          cursorColor: AppColors.primaryBlue,
          obscureText: _isObscure,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: IconButton(
                color: AppColors.dark.withOpacity(0.6),
                onPressed: () => setState(
                      () => _isObscure = !_isObscure,
                    ),
                icon:
                    Icon(_isObscure ? Icons.visibility_off : Icons.visibility)),
          )),
    );
  }
}

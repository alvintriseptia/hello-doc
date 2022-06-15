import 'package:flutter/material.dart';
import 'package:hello_doc/core/preferences/preferences.dart';
import 'package:hello_doc/core/presentation/widgets/custom_button.dart';
import 'package:hello_doc/core/presentation/widgets/password_form_field.dart';
import 'package:hello_doc/core/presentation/widgets/txt_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
          margin: const EdgeInsets.only(top: Dimens.dp30, bottom: Dimens.dp30),
          child: const Text('Sign In',
              style: Fonts.heading1, textAlign: TextAlign.center));
    }

    Widget signUp() {
      return Column(
        children: [
          Text(
            'Don\'t have an account?',
            style: Fonts.subtitle1.copyWith(
              color: AppColors.dark.withOpacity(0.5),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Fonts.buttonText,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/sign-up', (route) => false);
            },
            child: const Text('Sign Up'),
          ),
        ],
      );
    }

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16),
        child: SizedBox(
          width: double.infinity,
          child: ListView(
            children: [
              title(),
              const TxtFormField(
                hintText: "Email or Phone number",
                label: "",
              ),
              const PasswordFormField(),
              CustomButton(
                title: 'Sign In',
                margin: const EdgeInsets.only(bottom: 32),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
              ),
              signUp()
            ],
          ),
        ),
      ),
    ));
  }
}

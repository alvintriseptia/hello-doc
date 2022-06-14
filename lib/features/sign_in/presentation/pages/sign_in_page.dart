import 'package:flutter/material.dart';
import 'package:hello_doc/core/preferences/preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
          margin: const EdgeInsets.only(top: 32, bottom: 64),
          child: const Text('Sign In',
              style: Fonts.heading1, textAlign: TextAlign.center));
    }

    Widget inputEmail() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: TextFormField(
            cursorColor: AppColors.primaryBlue,
            decoration: const InputDecoration(
              hintText: 'Email or Phone number',
            )),
      );
    }

    Widget inputPassword() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: TextFormField(
            cursorColor: AppColors.primaryBlue,
            obscureText: _isObscure,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                  color: AppColors.dark.withOpacity(0.6),
                  onPressed: () => setState(
                        () => _isObscure = !_isObscure,
                      ),
                  icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility)),
            )),
      );
    }

    Widget button() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 32),
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
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
          child: const Text('Sign In'),
        ),
      );
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: ListView(
            children: [
              title(),
              inputEmail(),
              inputPassword(),
              button(),
              signUp()
            ],
          ),
        ),
      ),
    ));
  }
}

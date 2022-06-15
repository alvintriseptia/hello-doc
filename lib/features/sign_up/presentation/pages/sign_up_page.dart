import 'package:flutter/material.dart';
import 'package:hello_doc/core/preferences/preferences.dart';
import 'package:hello_doc/core/presentation/widgets/custom_button.dart';
import 'package:hello_doc/features/sign_up/presentation/pages/verify_phone_number_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
          margin: const EdgeInsets.only(top: Dimens.dp30, bottom: Dimens.dp24),
          child: const Text('Sign Up',
              style: Fonts.heading1, textAlign: TextAlign.center));
    }

    Widget hero() {
      return Container(
          margin: const EdgeInsets.only(bottom: Dimens.dp30),
          child: Column(
            children: [
              SizedBox(
                width: Dimens.dp200,
                child: Image.asset(
                  'assets/images/man-envelope.png',
                ),
              ),
              Text(
                'You Will receive 4 digit Code to\nverify the number',
                textAlign: TextAlign.center,
                style: Fonts.subtitle1.copyWith(
                    color: AppColors.dark.withOpacity(0.5),
                    letterSpacing: 0.5,
                    height: 1.5),
              )
            ],
          ));
    }

    Widget inputPhoneNumber() {
      return Container(
        margin: const EdgeInsets.only(bottom: Dimens.dp24, top: Dimens.dp32),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(Dimens.dp20),
              child: const Text('+62',
                  style: Fonts.subtitle1, textAlign: TextAlign.center),
              decoration: BoxDecoration(
                  color: AppColors.lightBlue.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      topLeft: Radius.circular(16))),
            ),
            Flexible(
              child: TextFormField(
                  keyboardType: TextInputType.phone,
                  cursorColor: AppColors.primaryBlue,
                  decoration: const InputDecoration(
                      hintText: 'Enter your phone number',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryBlue),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ))),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16),
        child: ListView(
          children: [
            title(),
            hero(),
            inputPhoneNumber(),
            CustomButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerifyPhoneNumberPage(),
                    ),
                  );
                }),
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:hello_doc/core/preferences/preferences.dart';
import 'package:hello_doc/core/presentation/widgets/custom_button.dart';
import 'package:hello_doc/features/sign_up/presentation/pages/create_account_page.dart';

class VerifyPhoneNumberPage extends StatefulWidget {
  const VerifyPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<VerifyPhoneNumberPage> createState() => _VerifyPhoneNumberPageState();
}

class _VerifyPhoneNumberPageState extends State<VerifyPhoneNumberPage> {
  bool _onEditing = false;
  String _code = "";

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return const Text('Verify Phone Number', style: Fonts.heading1);
    }

    Widget description() {
      return Container(
        margin: const EdgeInsets.only(bottom: Dimens.dp30),
        child: Text('A code has been sent to\n0123456789',
            textAlign: TextAlign.center,
            style: Fonts.heading3
                .copyWith(color: AppColors.dark.withOpacity(0.6))),
      );
    }

    Widget enterCode() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: Dimens.dp20),
        child: Text('Enter the code here',
            textAlign: TextAlign.center,
            style: Fonts.heading3
                .copyWith(color: AppColors.dark.withOpacity(0.6))),
      );
    }

    Widget otp() {
      return VerificationCode(
        autofocus: true,
        textStyle: const TextStyle(fontSize: 20.0, color: AppColors.dark),
        keyboardType: TextInputType.number,
        underlineColor: Colors.transparent,
        underlineUnfocusedColor: Colors.transparent,
        length: 4,
        cursorColor: AppColors.primaryBlue,
        onCompleted: (String value) {
          setState(() {
            _code = value;
          });
        },
        onEditing: (bool value) {
          setState(() {
            _onEditing = value;
          });
          if (!_onEditing) FocusScope.of(context).unfocus();
        },
      );
    }

    Widget resent() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: Dimens.dp30),
        child: Column(
          children: [
            Text(
              'Don\'t receive a code?',
              style: Fonts.subtitle1.copyWith(
                color: AppColors.dark.withOpacity(0.6),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Fonts.buttonText,
              ),
              onPressed: () {},
              child: const Text('Resent'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: title(),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          foregroundColor: AppColors.dark,
          iconTheme: const IconThemeData(size: Dimens.dp30),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                description(),
                enterCode(),
                otp(),
                resent(),
                CustomButton(
                    title: 'Create Account',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccountPage(),
                        ),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}

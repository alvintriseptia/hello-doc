import 'package:flutter/material.dart';
import 'package:hello_doc/core/preferences/preferences.dart';
import 'package:hello_doc/core/presentation/widgets/custom_button.dart';
import 'package:hello_doc/core/presentation/widgets/password_form_field.dart';
import 'package:hello_doc/core/presentation/widgets/txt_form_field.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  List<int> days = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
  ];
  List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List<int> years = [
    1990,
    1991,
    1992,
    1993,
    1994,
    1995,
    1996,
    1997,
    1998,
    1999,
    2000,
    2001,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010
  ];

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
          margin: const EdgeInsets.only(top: Dimens.dp16),
          child: const Text('Create Account', style: Fonts.heading1));
    }

    Widget inputDate() {
      return Container(
        margin: const EdgeInsets.only(bottom: Dimens.dp20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Date of birth',
              style: Fonts.heading2,
            ),
            const SizedBox(
              height: Dimens.dp16,
            ),
            Row(
              children: [
                Flexible(
                  child: DropdownButtonFormField(
                      items: days
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.toString()),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      decoration: const InputDecoration(hintText: 'Day')),
                ),
                const SizedBox(
                  width: Dimens.dp16,
                ),
                Flexible(
                  child: DropdownButtonFormField(
                      items: months
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.toString()),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      decoration: const InputDecoration(hintText: 'Month')),
                ),
                const SizedBox(
                  width: Dimens.dp16,
                ),
                Flexible(
                  child: DropdownButtonFormField(
                      items: years
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.toString()),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      decoration: const InputDecoration(hintText: 'Year')),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget inputPassword(String label, String hint, {bool confirm = false}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Fonts.heading2,
          ),
          const SizedBox(
            height: Dimens.dp16,
          ),
          PasswordFormField(hintText: hint)
        ],
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16),
            child: ListView(
              children: [
                const TxtFormField(
                    label: 'Your name', hintText: 'Full name...'),
                inputDate(),
                const TxtFormField(
                    label: 'Email Address', hintText: 'Your email here'),
                inputPassword(
                  'Password',
                  'Your password',
                ),
                inputPassword('Confirm Password', 'Confirm your password',
                    confirm: true),
                const Spacer(),
                CustomButton(
                  title: 'Get Started',
                  margin: const EdgeInsets.only(bottom: Dimens.dp32),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:hello_doc/core/preferences/preferences.dart';

class OnboardingContent extends StatelessWidget {
  final String textTitle;
  final String textDescription;
  final String imageUrl;

  const OnboardingContent(
      {Key? key,
      required this.textTitle,
      required this.textDescription,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image() {
      return Container(
        margin: const EdgeInsets.only(top: Dimens.dp125),
        width: 250,
        height: 200,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.contain,
        ),
      );
    }

    Widget title() {
      return Container(
          margin: const EdgeInsets.only(top: Dimens.dp75, bottom: Dimens.dp10),
          child: Text(textTitle, style: Fonts.heading1));
    }

    Widget description() {
      return Text(
        textDescription,
        style: Fonts.paragraph.copyWith(
          color: AppColors.dark.withOpacity(0.7),
        ),
        textAlign: TextAlign.center,
      );
    }

    return FittedBox(
      fit: BoxFit.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [image(), title(), description()],
      ),
    );
  }
}

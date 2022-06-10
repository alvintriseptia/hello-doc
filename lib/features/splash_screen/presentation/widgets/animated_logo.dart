import 'package:flutter/material.dart';
import 'package:hello_doc/core/preferences/dimens.dart';
import 'package:hello_doc/core/preferences/fonts.dart';

class AnimatedLogo extends StatelessWidget {
  AnimatedLogo({Key? key, required this.controller})
      : opacityLogo =
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.0,
            0.4,
            curve: Curves.easeIn,
          ),
        )),
        opacityText =
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.7,
            0.7,
            curve: Curves.easeIn,
          ),
        )),
        offsetLeft =
            Tween<Offset>(begin: Offset.zero, end: const Offset(-0.4, 0.0))
                .animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.7,
            1.0,
            curve: Curves.decelerate,
          ),
        )),
        offsetRight =
            Tween<Offset>(begin: Offset.zero, end: const Offset(1.0, 0.0))
                .animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.7,
            1.0,
            curve: Curves.decelerate,
          ),
        )),
        super(key: key);

  final AnimationController controller;
  final Animation<double> opacityLogo;
  final Animation<double> opacityText;
  final Animation<Offset> offsetLeft;
  final Animation<Offset> offsetRight;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(children: [
      FractionalTranslation(
        translation: offsetRight.value,
        child: Opacity(
          opacity: opacityText.value,
          child: Container(
            margin: const EdgeInsets.only(top: 2.0),
            child: const Text(
              'Doc',
              style: Fonts.splashText,
            ),
          ),
        ),
      ),
      FractionalTranslation(
        translation: offsetLeft.value,
        child: Container(
          margin: const EdgeInsets.only(top: Dimens.dp8),
          width: 130,
          height: 60,
          child: Opacity(
              opacity: opacityLogo.value,
              child: Image.asset('assets/icons/bubble-chat.png')),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

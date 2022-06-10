import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hello_doc/core/preferences/preferences.dart';
import 'package:hello_doc/features/onboarding/presentation/widgets/onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    repeatOnce();
  }

  void repeatOnce() async {
    try {
      await _animationController.forward().orCancel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() async {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> contents = [
      {
        'title': 'Find Your Doctor Online',
        'description':
            'Find a doctor who will take the\nbest care of your health',
        'imageUrl': 'assets/images/doctor.png',
      },
      {
        'title': 'Medicine Reminder',
        'description': 'Set up a reminder to take the\nmedicine on time',
        'imageUrl': 'assets/images/reminder.png',
      },
      {
        'title': 'Order Medicine Online',
        'description': 'Order your medicine that your\ndoctor provided you',
        'imageUrl': 'assets/images/order.png',
      },
    ];

    Widget buttonNavbar() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              style: TextButton.styleFrom(textStyle: Fonts.buttonText),
              onPressed: () {},
              child: const Text('Skip')),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryBlue, textStyle: Fonts.buttonText),
              onPressed: () {
                buttonCarouselController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
                if (_current == contents.length - 1) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                }
              },
              child: const Text('Next')),
        ],
      );
    }

    Widget indicatorCarousel() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: contents.asMap().entries.map((entry) {
          return Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == entry.key
                    ? AppColors.primaryBlue
                    : AppColors.dark.withOpacity(0.3)),
          );
        }).toList(),
      );
    }

    Widget carousel() {
      return CarouselSlider(
        carouselController: buttonCarouselController,
        items: [
          for (var content in contents)
            OnboardingContent(
              textTitle: content['title'],
              textDescription: content['description'],
              imageUrl: content['imageUrl'],
            ),
        ],
        options: CarouselOptions(
            scrollPhysics: const NeverScrollableScrollPhysics(),
            autoPlay: false,
            enableInfiniteScroll: false,
            height: 550,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      );
    }

    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      carousel(),
                      indicatorCarousel(),
                      const SizedBox(height: Dimens.dp20),
                      buttonNavbar()
                    ],
                  ),
                ))));
  }
}

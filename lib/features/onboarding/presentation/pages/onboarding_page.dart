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
    duration: const Duration(milliseconds: 1500),
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

  void repeatOnce() {
    _animationController.forward();
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
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                style: TextButton.styleFrom(textStyle: Fonts.buttonText),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign-in', (route) => false);
                },
                child: const Text('Skip')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryBlue,
                    textStyle: Fonts.buttonText),
                onPressed: () {
                  buttonCarouselController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                  if (_current == contents.length - 1) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  }
                },
                child: const Text('Next')),
          ],
        ),
      );
    }

    Widget indicatorCarousel() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: contents.asMap().entries.map((entry) {
          return Container(
            width: 20.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
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
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      );
    }

    return Scaffold(
        body: SafeArea(
            child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    carousel(),
                    indicatorCarousel(),
                    const Spacer(),
                    buttonNavbar()
                  ],
                ))));
  }
}

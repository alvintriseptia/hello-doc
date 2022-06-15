import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_doc/core/preferences/colors.dart';
import 'package:hello_doc/features/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: AppColors.lightBlue.withOpacity(0.1),
              hintStyle: TextStyle(color: AppColors.dark.withOpacity(0.4)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(16)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primaryBlue),
                  borderRadius: BorderRadius.circular(16))),
        ),
        title: 'Hello Doc',
        initialRoute: '/initial',
        routes: {
          '/': (context) =>
              const Scaffold(body: Center(child: Text("Home Screen"))),
          '/initial': (context) => const SplashScreen(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
        });
  }
}

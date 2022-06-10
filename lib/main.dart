import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_doc/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:hello_doc/features/splash_screen/presentation/pages/splash_screen.dart';

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
        ),
        title: 'Hello Doc',
        initialRoute: '/initial',
        routes: {
          '/': (context) => Scaffold(body: Center(child: Text("Home Screen"))),
          '/initial': (context) => const SplashScreen(),
          '/onboarding': (context) => const OnboardingPage(),
        });
  }
}

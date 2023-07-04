import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:grand_bazar/Screens/Home/home.dart';
import 'package:grand_bazar/Screens/Login/login.dart';
import 'package:grand_bazar/Screens/Settings/settings.dart';

class WorkInProgressScreen extends StatelessWidget {
  const WorkInProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(children: [
        Image.asset(
          'assets/WIP.gif',
          height: 195.0,
        ),
        const Text(
          '-Under Development-',
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(248, 228, 206, 6),
              fontFamily: 'Abril Fatface'),
        )
      ]),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      nextScreen: LoginScreen(),
      splashIconSize: 250,
      duration: 10000,
      splashTransition: SplashTransition.fadeTransition,
      //pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 3),
    );
  }
}

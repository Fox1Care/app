import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: SizedBox(
            width: 110,
            height: 110,
            child: Image.asset('lib/assets/icons/icon.png'),
          ),
        ),
      ),
      backgroundColor: Colors.green,
      nextScreen: HomePage(),
      splashIconSize: 250,
    );
  }
}
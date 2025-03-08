import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/screens/splash_screen.dart';
import 'package:app/services/favourites_service.dart';
import 'package:app/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavouritesService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/HomePage': (context) => HomePage(),
      },
    );
  }
}

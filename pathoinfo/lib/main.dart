import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/splash_screen.dart';
import 'pages/disease_page.dart';

void main() {
  runApp(const PathoEduApp());
}

class PathoEduApp extends StatelessWidget {
  const PathoEduApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PathoEdu',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF6F7F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      routes: {
        '/home': (context) => const HomePage(),
        '/diseases': (context) => const DiseasesPage(),
      },

      home: const SplashScreen(),
    );
  }
}

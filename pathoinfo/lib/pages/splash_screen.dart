import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        _progress += 0.1;
      });

      if (_progress >= 1.0) {
        timer.cancel();
        _goToHome();
      }
    });
  }

  void _goToHome() {
    Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),

          // LOGO
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.teal],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.biotech,
              size: 48,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          // APP NAME
          const Text(
            "PathoInfo",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // TAGLINE
          const Text(
            "KNOW DISEASES & PATHOLOGY BETTER",
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 1.2,
            ),
          ),

          const Spacer(),

          // PROGRESS BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.blue,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Getting things ready...",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

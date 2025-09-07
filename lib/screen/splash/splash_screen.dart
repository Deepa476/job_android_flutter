import 'dart:async';
import 'package:flutter/material.dart';
import 'package:job/router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        progress += 0.1;
        if (progress >= 1.0) {
          timer.cancel();
          Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          // 🔍 Search Icon
          const Icon(
            Icons.search,
            size: 60,
            color: Colors.blue,
          ),
          const SizedBox(height: 20),
          // App Name
          const Text(
            "JobFinder",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          // Subtitle
          const Text(
            "Connecting talent with opportunity.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const Spacer(),
          // Progress Indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: Colors.grey[300],
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

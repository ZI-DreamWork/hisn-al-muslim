import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zi_dikr/core/services/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      StorageService.setFirstOpen(true);
      Navigator.pushNamed(context, '/dikr_categories');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/dikr_splash.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

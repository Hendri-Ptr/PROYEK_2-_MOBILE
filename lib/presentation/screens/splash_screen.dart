import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeAndNavigate();
  }

  Future<void> _initializeAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('name') || !prefs.containsKey('password')) {
      await prefs.setString('name', 'user123');
      await prefs.setString('password', '123456');
    }

    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // Delay splash screen
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            isLoggedIn ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'LILIK.NET',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

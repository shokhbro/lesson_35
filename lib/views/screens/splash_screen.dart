import 'package:flutter/material.dart';
import 'package:lesson_35/views/screens/register_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
        return const RegisterScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Text(
          "Welcome to Online Shop",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

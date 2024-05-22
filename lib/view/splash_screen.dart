import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/view_model/name_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // navigate to loginScreen after delay
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
        context,
        RouteName.loginScreen,
        arguments: {'name': 'Ayushman'},
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset('assets/logo.jpg'),
        ),
      ),
    );
  }
}

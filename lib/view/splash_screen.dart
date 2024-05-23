import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/model/colors.dart';
import 'package:memoneet_task_flutterapp/view_model/routes/name_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // navigate to loginScreen after delay
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
        context,
        RouteName.loginScreen,
        arguments: {'title': 'Login'},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Icon(
            Icons.all_inclusive,
            size: 180,
            color: secondaryColor,
          ),
        ),
      ),
    );
  }
}

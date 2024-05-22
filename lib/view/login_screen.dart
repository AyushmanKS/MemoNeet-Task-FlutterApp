import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/view_model/colors.dart';
import 'package:memoneet_task_flutterapp/view_model/name_routes.dart';

class LoginScreen extends StatefulWidget {
  final Map args;
  const LoginScreen({super.key, required this.args});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args['title'].toString()),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // email text field-------------------------------------------------
            TextFormField(
              decoration: const InputDecoration(hintText: 'Enter Email'),
            ),
            const SizedBox(height: 12),
            // password text field----------------------------------------------
            TextFormField(
              decoration: const InputDecoration(hintText: 'Enter Password'),
            ),
            const SizedBox(height: 30),
            // Login Button-----------------------------------------------------
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RouteName.homeScreen);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    foregroundColor: whiteColor),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

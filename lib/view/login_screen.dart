import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/view_model/colors.dart';
import 'package:memoneet_task_flutterapp/view_model/name_routes.dart';
import 'package:memoneet_task_flutterapp/view_model/showdialog.dart';
import 'package:memoneet_task_flutterapp/view_model/textfields.dart';

class LoginScreen extends StatefulWidget {
  final Map args;

  LoginScreen({super.key, required this.args});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // textfield controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // login existing user
  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushReplacementNamed(context, RouteName.homeScreen);
    } on FirebaseAuthException catch (e) {
      displayErrorMessages(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // email text field-------------------------------------------------
            MyTextField(
                hintText: 'Enter Email',
                obsecureText: false,
                controller: emailController),
            const SizedBox(height: 12),
            // password text field----------------------------------------------
            MyTextField(
                hintText: 'Enter Password',
                obsecureText: true,
                controller: passwordController),
            const SizedBox(height: 20),
            // Login Button-----------------------------------------------------
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    foregroundColor: whiteColor),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // dont have an account-> navigate to registration screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.registrationScreen);
                  },
                  child: const Text(
                    ' Register Here',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

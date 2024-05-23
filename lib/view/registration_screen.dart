import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/view_model/colors.dart';
import 'package:memoneet_task_flutterapp/view_model/name_routes.dart';
import 'package:memoneet_task_flutterapp/view_model/textfields.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // textfield controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new account'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // username text field----------------------------------------------
            MyTextField(
                hintText: 'Username',
                obsecureText: false,
                controller: usernameController),

            const SizedBox(height: 12),
            // email text field-------------------------------------------------
            MyTextField(
                hintText: 'Enter Email',
                obsecureText: false,
                controller: emailController),

            const SizedBox(height: 12),
            // password text field----------------------------------------------
            MyTextField(
                hintText: 'Enter Password',
                obsecureText: false,
                controller: passwordController),

            const SizedBox(height: 12),
            // confirm password text field--------------------------------------
            MyTextField(
                hintText: 'Confirm Password',
                obsecureText: false,
                controller: confirmpasswordController),

            const SizedBox(height: 20),
            // Register Button--------------------------------------------------
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
                  'Register',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

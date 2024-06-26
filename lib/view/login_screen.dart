import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/model/colors.dart';
import 'package:memoneet_task_flutterapp/view_model/routes/name_routes.dart';
import 'package:memoneet_task_flutterapp/view_model/components/showdialog.dart';
import 'package:memoneet_task_flutterapp/view_model/components/textfields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // textfield controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // login existing user
  void login() async {
    if (validateInputs()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pushReplacementNamed(context, RouteName.homeScreen);
      } on FirebaseAuthException catch (e) {
        displayErrorMessages(e.message ?? e.code, context);
      }
    }
  }

  // input validation checking-----------------------------------------------------
  bool validateInputs() {
    if (emailController.text.isEmpty) {
      displayErrorMessages("Email cannot be empty", context);
      return false;
    } else if (passwordController.text.isEmpty) {
      displayErrorMessages("Password cannot be empty", context);
      return false;
    } else if (passwordController.text.length < 8) {
      displayErrorMessages("Password must be at least 8 characters", context);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Login with your credentials'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFF775ce1),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // icon-----------------------------------------------------
              const Icon(
                Icons.all_inclusive,
                size: 180,
                color: Color(0xFFFBEA89),
              ),
              const SizedBox(height: 12),
              // email text field-------------------------------------------------
              MyTextField(
                hintText: 'Enter Email',
                obsecureText: false,
                controller: emailController,
              ),
              const SizedBox(height: 12),
              // password text field----------------------------------------------
              MyTextField(
                hintText: 'Enter Password',
                obsecureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              // Login Button-----------------------------------------------------
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    foregroundColor: whiteColor,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // don't have an account -> navigate to registration screen
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.registrationScreen);
                    },
                    child: const Text(
                      ' Register Here',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

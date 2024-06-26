import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/model/colors.dart';
import 'package:memoneet_task_flutterapp/view_model/routes/name_routes.dart';
import 'package:memoneet_task_flutterapp/view_model/components/showdialog.dart';
import 'package:memoneet_task_flutterapp/view_model/components/textfields.dart';

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
  TextEditingController confirmpassController = TextEditingController();

  // Register/creating new user
  void registerUser() async {
    if (validateInputs()) {
      try {
        // Creating new user
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // storing credentials in firestore
        createUserDoc(userCredential);

        // Navigate to home screen upon successful registration
        Navigator.pushReplacementNamed(context, RouteName.homeScreen,
            arguments: {
              'username': usernameController.text,
            });
      } on FirebaseAuthException catch (e) {
        displayErrorMessages(e.message ?? e.code, context);
      }
    }
  }

  // validating textfield inputs
  bool validateInputs() {
    if (usernameController.text.isEmpty) {
      displayErrorMessages("Username cannot be empty", context);
      return false;
    } else if (emailController.text.isEmpty) {
      displayErrorMessages("Email cannot be empty", context);
      return false;
    } else if (passwordController.text.isEmpty) {
      displayErrorMessages("Password cannot be empty", context);
      return false;
    } else if (passwordController.text.length < 8) {
      displayErrorMessages("Password must be at least 8 characters", context);
      return false;
    } else if (passwordController.text != confirmpassController.text) {
      displayErrorMessages("Passwords don't match", context);
      return false;
    }
    return true;
  }

  // creating firestore database document to store user credentials
  Future<void> createUserDoc(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernameController.text
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Create a new account'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Gradient background
          Container(
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
          ),
          // Scrollable content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60), // Add some spacing from the top
                  // icon-----------------------------------------------------
                  const Icon(
                    Icons.all_inclusive,
                    size: 180,
                    color: Color(0xFFFBEA89),
                  ),
                  const SizedBox(height: 12),
                  // username text field----------------------------------------------
                  MyTextField(
                    hintText: 'Username',
                    obsecureText: false,
                    controller: usernameController,
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
                  const SizedBox(height: 12),
                  // confirm password text field--------------------------------------
                  MyTextField(
                    hintText: 'Confirm Password',
                    obsecureText: true,
                    controller: confirmpassController,
                  ),
                  const SizedBox(height: 20),
                  // Register Button--------------------------------------------------
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: registerUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        foregroundColor: whiteColor,
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

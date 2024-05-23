import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/view_model/colors.dart';
import 'package:memoneet_task_flutterapp/view_model/components/drawer.dart';

class HomeScreen extends StatefulWidget {
  //final Map args;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // to logout user
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text('Home'),
        // Text(
        //   'Hello ${widget.args['username'].toString()} !',
        //   style: const TextStyle(fontWeight: FontWeight.bold),
        // ),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      drawer: const CustomizedDrawer(),
    );
  }
}

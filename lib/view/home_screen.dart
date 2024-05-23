import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/view_model/colors.dart';

class HomeScreen extends StatefulWidget {
  //final Map args;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title: const Text('Welcome back !')
          // Text(
          //   'Hello ${widget.args['username'].toString()} !',
          //   style: const TextStyle(fontWeight: FontWeight.bold),
          // ),
          ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Map args;
  const LoginScreen({super.key, required this.args});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // String name = "";
  // @override
  // void initState() {
  //   if (widget.args.containsKey('name')) {
  //     name = widget.args['name'];
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.args['name'].toString()),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/model/colors.dart';
import 'package:memoneet_task_flutterapp/view_model/components/showdialog.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // currently logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  // fetching current user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: primaryColor,
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            displayErrorMessages(snapshot.error.toString(), context);
            return const Center(child: Text('An error occurred!'));
          } else if (snapshot.hasData && snapshot.data!.exists) {
            // extracting data
            Map<String, dynamic>? user = snapshot.data!.data();

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: drawerColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.all(35),
                    child: const Icon(
                      Icons.person_2_sharp,
                      size: 45,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(user!['username'],
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(
                    user['email'],
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data found!'));
          }
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/view_model/colors.dart';
import 'package:memoneet_task_flutterapp/view_model/components/drawer.dart';
import 'package:memoneet_task_flutterapp/view_model/components/post_button.dart';
import 'package:memoneet_task_flutterapp/view_model/components/textfields.dart';
import 'package:memoneet_task_flutterapp/view_model/database/firestore.dart';
import 'package:memoneet_task_flutterapp/view_model/routes/name_routes.dart';

class HomeScreen extends StatefulWidget {
  //final Map args;
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // firestore instance/access
  final FirestoreDatabase thoughtDatabase = FirestoreDatabase();

  TextEditingController thoughtController = TextEditingController();

  // to logout user
  void logout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, RouteName.loginScreen);
  }

  // post thought on screen
  void postThought() {
    if (thoughtController.text.isNotEmpty) {
      String message = thoughtController.text;
      thoughtDatabase.addThought(message);
    }
    thoughtController.clear();
  }

  // delete thought from database
  void deleteThought(String docId) {
    thoughtDatabase.deleteThought(docId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text('My Thoughts'),
        // Text(
        //   'Hello ${widget.args['username'].toString()} !',
        //   style: const TextStyle(fontWeight: FontWeight.bold),
        // ),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      drawer: const CustomizedDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                      hintText: 'Write your thoughts...',
                      obsecureText: false,
                      controller: thoughtController),
                ),

                // post thoughts button
                PostButton(onTap: postThought)
              ],
            ),
          ),

          // Posting thoughts on screen
          StreamBuilder(
            stream: thoughtDatabase.getThoughtsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final posts = snapshot.data!.docs;

              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text('No Thoughts yet...write something !'),
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    String docId = post.id;

                    String message = post['ThoughtMessage'];
                    String userEmail = post['UserEmail'];
                    Timestamp timestamp = post['TimeStamp'];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ListTile(
                        title: Text(message),
                        subtitle: Text(userEmail),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            deleteThought(docId);
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

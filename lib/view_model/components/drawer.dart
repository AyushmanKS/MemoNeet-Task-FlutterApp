import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/view_model/colors.dart';

class CustomizedDrawer extends StatelessWidget {
  const CustomizedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: drawerColor,
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(Icons.search, size: 50, color: secondaryColor)),
          // Home------------------------------------------------------
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: secondaryColor,
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20, color: secondaryColor),
              ),
            ),
          ),
          // Profile -------------------------------------------------
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: secondaryColor,
              ),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 20, color: secondaryColor),
              ),
            ),
          ),
          // Users-----------------------------------------------------------
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: ListTile(
              leading: Icon(
                Icons.people,
                color: secondaryColor,
              ),
              title: Text(
                'Users',
                style: TextStyle(fontSize: 20, color: secondaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

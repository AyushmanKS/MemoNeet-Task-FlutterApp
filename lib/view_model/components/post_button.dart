import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/view_model/colors.dart';

class PostButton extends StatelessWidget {
  final void Function()? onTap;
  const PostButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(left: 10),
        child: Center(
          child: Icon(
            Icons.done,
            color: primaryColor,
            size: 28,
          ),
        ),
      ),
    );
  }
}

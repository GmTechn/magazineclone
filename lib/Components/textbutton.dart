import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  MyTextButton({super.key, required this.onTap, required this.ButtonText});

  final VoidCallback onTap;
  final String ButtonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
          onPressed: onTap,
          child: Text(
            ButtonText,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}

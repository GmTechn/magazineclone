import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  MyTextButton(
      {super.key,
      required this.onTap,
      required this.ButtonText,
      required this.ButtonHeight,
      required this.ButtonWidth});

  final VoidCallback onTap;
  final String ButtonText;
  final double ButtonHeight;
  final double ButtonWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ButtonHeight,
      width: ButtonWidth,
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
          onPressed: onTap,
          child: Text(
            textAlign: TextAlign.center,
            ButtonText,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}

import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({
    super.key,
    required this.textfieldtitle,
    required this.textfieldController,
  });
  final String textfieldtitle;
  final TextEditingController textfieldController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: textfieldController,
        decoration: InputDecoration(
          labelText: textfieldtitle,
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.pink.shade100),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
        ),
      ),
    );
  }
}

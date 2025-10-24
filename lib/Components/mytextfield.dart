import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({
    super.key,
    required this.textfieldtitle,
    required this.textfieldController,
    this.onSaved,
    this.validator,
  });

  final String textfieldtitle;
  final TextEditingController textfieldController;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        cursorColor: Colors.pink,
        cursorErrorColor: Colors.deepPurple,
        controller: textfieldController,
        decoration: InputDecoration(
            labelText: textfieldtitle,
            labelStyle: const TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.pink.shade100),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Colors.deepPurple, width: 1))),
      ),
    );
  }
}

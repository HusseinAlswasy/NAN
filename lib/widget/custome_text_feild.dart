import 'package:flutter/material.dart';

class CustomeTextFeild extends StatelessWidget {
  CustomeTextFeild(
      {super.key, required this.hint, this.maxline = 1, this.onsaved});

  @override
  String hint;
  int maxline;
  void Function(String?)? onsaved;
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Vailed is required';
        }
      },
      maxLines: maxline,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.deepPurple,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

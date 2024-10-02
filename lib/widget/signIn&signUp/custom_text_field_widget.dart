import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({super.key, required this.label, this.onChange});
  final String label;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      cursorErrorColor: Colors.white,
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }
}

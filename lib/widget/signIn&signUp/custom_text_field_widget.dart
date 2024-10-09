import 'package:flutter/material.dart';

class CustomFormTextFieldWidget extends StatelessWidget {
  const CustomFormTextFieldWidget(
      {super.key, required this.label, this.onChange});
  final String label;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
      },
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

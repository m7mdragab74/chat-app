import 'package:flutter/material.dart';

class CustomFormTextFieldWidget extends StatelessWidget {
  const CustomFormTextFieldWidget(
      {super.key, required this.label, this.onChange, required this.obscure});
  final String label;
  final void Function(String)? onChange;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
      },
      style: TextStyle(
        color: Colors.white,
      ),
      obscureText: obscure,
      cursorColor: Colors.white,
      cursorErrorColor: Colors.white,
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }
}

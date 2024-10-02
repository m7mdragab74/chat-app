import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.height,
      required this.fontSize,
      required this.textColor,
      required this.label,
      this.onTap});
  final double height;
  final double fontSize;
  final Color textColor;
  final String label;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        minimumSize: Size(double.infinity, height),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}

import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: kPrimaryColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(kLogo, height: 55),
        const SizedBox(width: 10),
        const Text(
          'Chat',
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

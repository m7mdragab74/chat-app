import 'package:chat_app/constants.dart';
import 'package:chat_app/widget/chat/chat_bubble.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 55,
            ),
            Text(
              'Chat',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: ChatBubble(),
    );
  }
}

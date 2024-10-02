import 'package:chat_app/views/home_screen.dart';
import 'package:chat_app/views/sign_in_screen.dart';
import 'package:chat_app/views/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'SignInScreen': (context) => const SignInScreen(),
        'SignUpScreen': (context) => const SignUpScreen(),
        'HomeScreen': (context) => const HomeScreen(),
      },
      initialRoute: 'SignInScreen',
    );
  }
}

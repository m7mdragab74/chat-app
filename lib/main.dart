import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/views/home_screen.dart';
import 'package:chat_app/views/sign_in_screen.dart';
import 'package:chat_app/views/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'SignInScreen': (context) => SignInScreen(),
        'SignUpScreen': (context) => SignUpScreen(),
        'HomeScreen': (context) => HomeScreen(),
      },
      initialRoute: 'SignInScreen',
    );
  }
}

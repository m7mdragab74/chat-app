import 'package:flutter/material.dart';

class SignInHeadWidget extends StatelessWidget {
  const SignInHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/scholar.png',
            height: 100,
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
            'Scholar Chat',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontFamily: 'pacifico',
            ),
          ),
        ],
      ),
    );
  }
}

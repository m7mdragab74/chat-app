import 'package:chat_app/views/home_screen.dart';
import 'package:chat_app/views/sign_in_screen.dart';
import 'package:chat_app/widget/signIn&signUp/custom_button_widget.dart';
import 'package:chat_app/widget/signIn&signUp/custom_text_field_widget.dart';
import 'package:chat_app/widget/signIn&signUp/sign_in_head_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2E445E),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SignInHeadWidget(),
            const SizedBox(
              height: 70,
            ),
            const Text(
              'REGISTER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const CustomTextFieldWidget(
              label: 'Email',
            ),
            const SizedBox(
              height: 12,
            ),
            const CustomTextFieldWidget(
              label: 'Password',
            ),
            const SizedBox(
              height: 19,
            ),
            CustomButtonWidget(
              label: 'REGISTER',
              fontSize: 18,
              textColor: Colors.black,
              height: 42,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'already have an account?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xff5A7182),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

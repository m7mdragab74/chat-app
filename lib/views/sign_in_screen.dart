import 'package:chat_app/views/home_screen.dart';
import 'package:chat_app/views/sign_up_screen.dart';
import 'package:chat_app/widget/signIn&signUp/custom_button_widget.dart';
import 'package:chat_app/widget/signIn&signUp/custom_text_field_widget.dart';
import 'package:chat_app/widget/signIn&signUp/sign_in_head_widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              'Sign In',
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
              label: 'Sign In',
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
                  'don\'t have an account?',
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
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
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

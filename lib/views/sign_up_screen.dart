import 'package:chat_app/constants.dart';
import 'package:chat_app/widget/signIn&signUp/custom_button_widget.dart';
import 'package:chat_app/widget/signIn&signUp/custom_text_field_widget.dart';
import 'package:chat_app/widget/signIn&signUp/sign_in_head_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
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
            CustomTextFieldWidget(
              label: 'Email',
              onChange: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextFieldWidget(
              label: 'Password',
              onChange: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 19,
            ),
            CustomButtonWidget(
              label: 'REGISTER',
              fontSize: 18,
              textColor: Colors.black,
              height: 42,
              onTap: () async {
                var auth = FirebaseAuth.instance;
                UserCredential user = await auth.createUserWithEmailAndPassword(
                    email: email!, password: password!);
                print(user.user!.displayName);
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
                    Navigator.pop(context);
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

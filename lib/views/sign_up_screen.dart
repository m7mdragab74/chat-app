import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/widget/signIn&signUp/custom_button_widget.dart';
import 'package:chat_app/widget/signIn&signUp/custom_text_field_widget.dart';
import 'package:chat_app/widget/signIn&signUp/sign_in_head_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SignInHeadWidget(),
                const SizedBox(
                  height: 59,
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
                CustomFormTextFieldWidget(
                  label: 'Email',
                  onChange: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomFormTextFieldWidget(
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
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await registerUser();
                        showSnackBar(context, 'Success');
                        Navigator.pushNamed(context, 'HomeScreen');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provide is too week');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account  already exists for that email');
                        }
                      } catch (e) {
                        showSnackBar(context, 'There was an error, try again!');
                        print(e);
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
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
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}

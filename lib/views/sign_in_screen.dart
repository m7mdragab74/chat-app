import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/cubits/login_cubit/login_state.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/widget/signIn&signUp/custom_button_widget.dart';
import 'package:chat_app/widget/signIn&signUp/custom_text_field_widget.dart';
import 'package:chat_app/widget/signIn&signUp/sign_in_head_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          Navigator.pushNamed(
            context,
            'HomeScreen',
          );
          isLoading = false;
        } else if (state is LoginFailureState) {
          showSnackBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
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
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  CustomFormTextFieldWidget(
                    obscure: false,
                    label: 'Email',
                    onChange: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomFormTextFieldWidget(
                    obscure: true,
                    label: 'Password',
                    onChange: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  CustomButtonWidget(
                    label: 'Sign In',
                    fontSize: 18,
                    textColor: Colors.black,
                    height: 42,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context)
                            .loginUser(email: email!, password: password!);
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
                          Navigator.pushNamed(context, 'SignUpScreen');
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
          ),
        ),
      ),
    );
  }
}

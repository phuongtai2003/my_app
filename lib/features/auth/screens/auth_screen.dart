import 'package:flutter/material.dart';
import 'package:my_app/common/custom_button.dart';
import 'package:my_app/common/custom_textfield.dart';
import 'package:my_app/features/auth/services/auth_services.dart';

enum Auth {
  signUp,
  signIn,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = "/auth-screen";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final AuthServices _authServices = AuthServices();

  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _nameTextController.dispose();
  }

  void registerUser() {
    _authServices.signUpUser(
        context: context,
        email: _emailTextController.text,
        password: _passwordTextController.text,
        name: _nameTextController.text);
  }

  Auth _auth = Auth.signUp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 200,
                  width: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton(
                        buttonText: "Sign Up",
                        onTap: () {
                          if (_auth != Auth.signUp) {
                            setState(
                              () {
                                _auth = Auth.signUp;
                              },
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomButton(
                        buttonText: "Log in",
                        onTap: () {
                          if (_auth != Auth.signIn) {
                            setState(
                              () {
                                _auth = Auth.signIn;
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _auth == Auth.signIn ? _signInFormKey : _signUpFormKey,
                  child: Column(
                    children: [
                      if (_auth == Auth.signUp)
                        CustomTextField(
                          textEditingController: _nameTextController,
                          hintText: "name",
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        textEditingController: _emailTextController,
                        hintText: "email",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        textEditingController: _passwordTextController,
                        hintText: "password",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      if (_auth == Auth.signUp)
                        CustomButton(
                          buttonText: "Register",
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              registerUser();
                            }
                          },
                        ),
                      if (_auth == Auth.signIn)
                        CustomButton(
                          buttonText: "Sign in",
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {}
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

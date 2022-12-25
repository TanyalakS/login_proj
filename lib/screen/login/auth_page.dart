import 'package:flutter/material.dart';
import 'package:login_proj/screen/login/login.dart';
import 'package:login_proj/screen/login/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogIn = true;

  @override
  Widget build(BuildContext context) => 
  isLogIn ? LogIn(onClickedSignUp: toggle) : SignUp(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogIn = !isLogIn);
}
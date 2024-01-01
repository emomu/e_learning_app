import 'package:elearningapp/views/ui/login/widgets/loginbutton.dart';
import 'package:elearningapp/views/ui/login/widgets/password_textfield.dart';
import 'package:elearningapp/views/ui/login/widgets/username_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginButton(),
              UsernameTextField(),
              PasswordTextField(),
              TextField()
            ],


      )),
    );
  }
}

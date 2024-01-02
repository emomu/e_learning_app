import 'package:elearningapp/blocs/auth/login/login_bloc.dart';
import 'package:elearningapp/blocs/auth/login/login_state.dart';
import 'package:elearningapp/data/repo/auth/login/login_repo.dart';
import 'package:elearningapp/views/ui/login/form_subbmission_status.dart';
import 'package:elearningapp/views/ui/login/widgets/loginbutton.dart';
import 'package:elearningapp/views/ui/login/widgets/password_textfield.dart';
import 'package:elearningapp/views/ui/login/widgets/username_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(authRepo: context.read<LoginRepo>()),
      child: BlocListener<LoginBloc,LoginState>(
        listenWhen: ((previous,current) => previous.formStatus != current.formStatus),
        listener: (context,state){
          final formStatus = state.formStatus;
          if(formStatus is SubmissionFailed){
            _showSnackBar(context, formStatus.exception.toString());

          }

        },
        child: Scaffold(
          backgroundColor: Color(0xFF00a86f),
          body: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 175,
                      height: 175,
                      child: Image.asset("resimler/logo.png")),
                  UsernameTextField(),
                  PasswordTextField(),
                  LoginButton(formKey: _formKey,),
                ],


              )),
        ),

      ),
    );
  }

  void _showSnackBar(BuildContext context,String message){
    final snackBar = SnackBar(content: Text(message)
  );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

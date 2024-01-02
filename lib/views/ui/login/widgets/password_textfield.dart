import 'package:elearningapp/blocs/auth/login/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/auth/login/login_bloc.dart';
import '../../../../blocs/auth/login/login_state.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
        builder:((context,state){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration
                (
                icon: Icon(Icons.key),
                disabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ) ,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                labelText: "Şifre",labelStyle: TextStyle(color: Colors.white),
                iconColor: Colors.white,

              ),
              validator: (value) => state.isValidUsername ? null : "Şifre çok kısa",
              onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(password: value)),
            ),

          );
        })
    );
  }
}

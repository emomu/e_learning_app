import 'package:elearningapp/blocs/auth/login/login_bloc.dart';
import 'package:elearningapp/blocs/auth/login/login_event.dart';
import 'package:elearningapp/blocs/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
      builder:((context,state){
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            decoration: InputDecoration
              (
              icon: Icon(Icons.person),
              disabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
              ) ,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
              ),
              labelText: "Kullanıcı Adı",labelStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,

            ),
            validator: (value) => state.isValidUsername ? null : "Kullanıcı adı çok kısa",
            onChanged: (value) => context.read<LoginBloc>().add(LoginUsernameChanged(username: value)),
          ),

        );
      })
    );
  }
}

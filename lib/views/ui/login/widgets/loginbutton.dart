import 'package:elearningapp/blocs/auth/login/login_event.dart';
import 'package:elearningapp/views/ui/login/form_subbmission_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/auth/login/login_bloc.dart';
import '../../../../blocs/auth/login/login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key,required this.formKey});

  final dynamic formKey;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
        builder:((context,state){
          return state.formStatus is FormSubmitting
              ? Center(child: CircularProgressIndicator())
              : ElevatedButton(onPressed: (){
                if(formKey.currentState!.validate())
                  {
                    context.read<LoginBloc>().add(LoginSubmit());
                  }
          }, child: Text("Giriş"));


        })
    );
  }
}

import 'package:elearningapp/views/ui/login/form_subbmission_status.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable{
  final String username;
  bool get isValidUsername => username.length > 5;
  final String password;
  bool get isValidPassword => password.length > 5;

  final FormSubmissionStatus formStatus;

  const LoginState({
     this.username="",this.password="",this.formStatus = const InitialFormStatus(),
});

  LoginState copyWrite(
  {
    String? username,
    String? password,
    FormSubmissionStatus? formStatus
  }
      ){
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }


  @override
  List<Object?> get props => [
    username,
    password,
    formStatus
  ];

}
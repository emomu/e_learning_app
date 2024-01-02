import 'package:elearningapp/blocs/auth/login/login_event.dart';
import 'package:elearningapp/blocs/auth/login/login_state.dart';
import 'package:elearningapp/views/ui/login/form_subbmission_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elearningapp/data/repo/auth/login/login_repo.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  final LoginRepo? authRepo;



  LoginBloc({required this.authRepo}) : super(const LoginState()){
   on<LoginEvent>(
       (event,emit) async {
         await mapEventToState(event,emit);
       },
   );
  }

  Future mapEventToState(LoginEvent event,Emitter<LoginState> emit) async {
    if(event is LoginUsernameChanged){
      emit(state.copyWrite(username: event.username));
    }else if(event is LoginPasswordChanged){
      emit(state.copyWrite(password: event.password));
    }else if(event is LoginSubmit){
      emit(state.copyWrite(formStatus: FormSubmitting()));
    }

    try{
        await authRepo?.login();
        emit(state.copyWrite(formStatus: SubmissionSuccess()));


    }catch(e){
      emit(state.copyWrite(formStatus: SubmissionFailed(e)));
    }

  }


}
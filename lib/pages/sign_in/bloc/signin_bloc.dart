
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_events.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_states.dart';

class SigninBloc extends Bloc<SigninEvents, SigninStates> {
  SigninBloc() : super(SigninStates()) {
    // on<EmailEvent>(_emailEvent);
    on<EmailEvent>((event, emit) {
      print("email is------${event.email}");
      emit(state.copywith(
        email: event.email,
      ));
    });
    on<PasswordEvent>((event, emit) {
      print("pwd is------${event.password}");

      emit(state.copywith(
        password: event.password,
      ));
    });
    // on<PasswordEvent>(_pwdEvent);

  }
  void _emailEvent(EmailEvent event, Emitter<SigninStates> emit) {
    print("my email is------${event.email}");
    emit(state.copywith(email: event.email));
  }
  void _pwdEvent(PasswordEvent event, Emitter<SigninStates> emit) {
    print("my pwd is------${event.password}");

    emit(state.copywith(password: event.password));
  }
}

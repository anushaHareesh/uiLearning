import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/register/bloc/register_events.dart';
import 'package:ulearning/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBlocs() : super(RegisterStates()) {
    on<UserNameEvent>((event, emit) {
      print("username------${event.userName}");
      emit(state.copyWith(
        userName: event.userName,
      ));
    });

    on<EmailEvent>(
      (event, emit) {
        print("email------${event.email}");

        emit(state.copyWith(email: event.email));
      },
    );

    on<PasswordEvent>(
      (event, emit) {
        emit(state.copyWith(password: event.password));
      },
    );
    on<RePasswordEvent>(
      (event, emit) {
        emit(state.copyWith(rePassword: event.rePassword));
      },
    );
  }
}

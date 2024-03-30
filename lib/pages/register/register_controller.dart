import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/widgets/flutter_toast.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  Future<void> handlRegister() async {
    final state = BlocProvider.of<RegisterBlocs>(context).state;
    final String username = state.userName;
    final String email = state.email;
    final String password = state.password;
    final String rePassword = state.rePassword;
  print("bsjbasjhbsd-------$username---$email---$password---$rePassword");
    if (username.isEmpty) {
      toastFlutter(msg: "UserName cant be empty");
      return;
    }
    if (email.isEmpty) {
      toastFlutter(msg: "Email cant be empty");
      return;
    }
    if (password.isEmpty) {
      toastFlutter(msg: "password cant be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastFlutter(msg: "Repassword cant be empty");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        credential.user?.sendEmailVerification();
        credential.user?.updateDisplayName(username);
        toastFlutter(
            msg:
                'an Email has been sent to your regitsered email.To activate it Please click on that link');
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastFlutter(msg: "weak password");
      } else if (e.code == "email-already-in-use") {
        toastFlutter(msg: "email alrdy used ");
      } else if (e.code == "invalid-email") {
        toastFlutter(msg: "email is invalid ");
      }
    }
  }

}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ulearning/common/service/storage_service.dart';
import 'package:ulearning/common/values/constants.dart';
import 'package:ulearning/common/widgets/flutter_toast.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_bloc.dart';

class SigninController {
  BuildContext context;
  SigninController({required this.context});

  void handleSignin(String type) async {
    try {
      if (type == "email") {
        final state = BlocProvider.of<SigninBloc>(context).state;

        final emailAdd = state.email.trim();
        final paswd = state.password.trim();
        print("email-values----$emailAdd----$paswd");

        if (emailAdd.isEmpty||paswd.isEmpty) {
          print("empty emil");
            toastFlutter(msg: "Fill the fields");

        } 

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: emailAdd, password: paswd);
          if (credential.user == null) {
            toastFlutter(msg: "user does not exist");
            return;
            // Fluttertoast.showToast(msg:"bajhbaejfhbaefhb",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.TOP);
          } else if (!credential.user!.emailVerified) {
            toastFlutter(msg: "not verified");
          }
          var user = credential.user;
          if (user != null) {
            toastFlutter(msg: "user exist");
            StorageService().setString(AppConstants.STORAGE_USER_KEY, "123456");
            Navigator.pushNamed(context, "application");
          } else {
            toastFlutter(msg: "user not exist");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastFlutter(msg: "no user found for that email");
            return;

          } else if (e.code == "wrong-password") {
            print("wrong paswwr");
            toastFlutter(msg: "wrong pwd provided for the email");
            return;

          } else if (e.code == "invaid-email") {
            toastFlutter(msg: "email formt is wrong");
            return;
          }
        }
      }
    } catch (e) {
      print("error------${e}");
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/common/common_widgets.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_events.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_states.dart';
import 'package:ulearning/pages/sign_in/signin_controller.dart';
import 'package:ulearning/pages/sign_in/widgets/sign_in_widget.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninBloc, SigninStates>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppbar('Log in'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                iconWidget(context),
                Center(
                    child: reusableText("Or use your gmail account to login")),
                Container(
                  // height: 30.h,
                  margin: EdgeInsets.only(top: 30.h, left: 20.h),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      reusableText("Email"),
                      SizedBox(
                        height: 5.h,
                      ),
                      reusabletextField(
                        "Enter Your Email Address",
                        "email",
                        "user",
                        (value) {
                          BlocProvider.of<SigninBloc>(context)
                              .add(EmailEvent(value));
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      reusableText("Password"),
                      SizedBox(
                        height: 5.h,
                      ),
                      reusabletextField(
                        "Enter Your Email Password",
                        "password",
                        "lock",
                        (value) {
                          BlocProvider.of<SigninBloc>(context)
                              .add(PasswordEvent(value));
                        },
                      ),
                      forgotPasswrd(),
                      buildLogandRegButton(
                        "Log In", 
                        "login",
                        () {
                          SigninController(context: context)
                              .handleSignin("email");
                        },
                      ),
                      buildLogandRegButton(
                        "Register",
                        "reg",
                        () {
                          Navigator.pushNamed(context, "register");
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/common/common_widgets.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/register/bloc/register_events.dart';
import 'package:ulearning/pages/register/bloc/register_states.dart';
import 'package:ulearning/pages/register/register_controller.dart';

import 'package:ulearning/pages/sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppbar("Signup"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // iconWidget(context)
                SizedBox(
                  height: 25.h,
                ),
                Center(
                    child: reusableText("Enter Your details and free signup")),
                Container(
                  // height: 30.h,
                  margin: EdgeInsets.only(top: 30.h, left: 20.h),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("User name"),
                      SizedBox(
                        height: 5.h,
                      ),
                      reusabletextField(
                        "Enter Your name",
                        "email",
                        "user",
                        (value) {
                          BlocProvider.of<RegisterBlocs>(context).add(UserNameEvent(value));
                        },
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
                         BlocProvider.of<RegisterBlocs>(context).add(EmailEvent(value));
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
                          BlocProvider.of<RegisterBlocs>(context).add(PasswordEvent(value));
                        },
                      ),
                      reusableText("Confirm password"),
                      SizedBox(
                        height: 5.h,
                      ),
                      reusabletextField(
                        "Enter Your Confirm password",
                        "password",
                        "lock",
                        (value) {
                         BlocProvider.of<RegisterBlocs>(context).add(RePasswordEvent(value));
                        },
                      ),
                      reusableText(
                          "By creating an account you have to agree with our terms and conditions"),
                      buildLogandRegButton(
                        "Register",
                        "login",
                        () {
                          RegisterController(context).handlRegister();
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

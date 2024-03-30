import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastFlutter({ required String msg, Color bgColor=Colors.black,Color textColor=Colors.white}){
return Fluttertoast.showToast(msg:msg,toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.TOP,textColor: textColor,backgroundColor: bgColor);
}
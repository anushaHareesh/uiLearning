import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';



Widget iconWidget(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(left: 10.h, right: 10.h, top: 10.h, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          iconscircle("google"),
          iconscircle("facebook"),
          iconscircle("apple"),
        ],
      ));
}

Widget iconscircle(
  String iconname,
) {
  return Container(
      height: 30.h,
      width: 30.h,
      child: Image.asset('assets/icons/$iconname.png'));
}

Widget reusableText(String text) {
  return Text(text,style: TextStyle(color: Colors.grey.withOpacity(0.5)),);
}

Widget reusabletextField(
    String text, String type, String icon, void Function(String val)? func) {
  return Container(
    margin: EdgeInsets.only(left: 10.h, right: 10.h, bottom: 10.h),
    child: TextField(
      onChanged: (val){func!(val);},
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 5, right: 0, bottom: 15),
          child:
              SizedBox(height: 4, child: Image.asset('assets/icons/$icon.png')),
        ),
        // label: const Text('Name'),
        hintText: text,
        hintStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: Colors.grey.withOpacity(0.5)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget forgotPasswrd() {
  return GestureDetector(
      child: Container(
    width: 264.h,
    height: 44.h,
    child: Text("Forgot Password ?",
        style: TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue)),
  ));
}

Widget buildLogandRegButton(String btn, String type, void Function() func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(right: 10.h, left: 10.h, top: 17.h),
      height: 50.h,
      width: 300.h,
      child: Center(
        child: Text(
          btn,
          style:
              TextStyle(color: type == "login" ? Colors.white : Colors.black),
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: type == "login" ? Colors.transparent : Colors.grey),
          color: type == "login" ? AppColors.primaryElement : Colors.white,
          borderRadius: BorderRadius.circular(15)),
    ),
  );
}

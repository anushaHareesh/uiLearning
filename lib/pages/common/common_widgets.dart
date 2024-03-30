import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppbar(String type) {
  return AppBar(
    centerTitle: true,
    bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Container(
          height: 1.0,
          color: Colors.grey.withOpacity(0.5),
        )),
    title: Text(
      type,
      style: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 14.sp, color: Colors.grey),
    ),
  );
}
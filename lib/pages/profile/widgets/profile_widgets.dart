import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 17.h,
            width: 17.w,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Text(
            "Profile",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 17.h,
            width: 17.w,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

Widget profileIcon() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.h),
    child: Image.asset(
      'assets/icons/edit_3.png',
      height: 25.h,
      width: 25.w,
    ),
    height: 80.h,
    width: 80.w,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/icons/headpic.png'))),
  );
}

Map imageInfo = {
  "Settings": "settings.png",
  "Payment Details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png",


};

Widget buildListView() {
  return Container(
    margin: EdgeInsets.only(left: 15.w),
    child: Column(
      children: [
        ...List.generate(
            imageInfo.length,
            (index) => Container(
              margin: EdgeInsets.all(8.h),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.h),
                        height: 40.h,width: 40.w,
                          decoration: BoxDecoration(
                              color: AppColors.primaryElement,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                "assets/icons/${imageInfo.values.elementAt(index)}",),
                          )),

                      Text(imageInfo.keys.elementAt(index),style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ))
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';

Widget buildPages(int index){
  List<Widget> _list=[
    Center(child: Text("Home"),),
    Center(child: Text("Search"),),
    Center(child: Text("Course"),),
    Center(child: Text("jhdjhasd"),),

  ];
  return _list[index];
}

var bottomTabs=[
  BottomNavigationBarItem(
                        activeIcon: SizedBox(
                            height: 15.h,
                            width: 15.h,
                            child: Image.asset(
                              "assets/icons/home.png",
                              color: AppColors.primaryElement,
                            )),
                        label: "home",
                        icon: SizedBox(
                            height: 15.h,
                            width: 15.h,
                            child: Image.asset("assets/icons/home.png"))),
                    BottomNavigationBarItem(
                        activeIcon: SizedBox(
                            height: 15.h,
                            width: 15.h,
                            child: Image.asset(
                              "assets/icons/search2.png",
                              color: AppColors.primaryElement,
                            )),
                        label: "Search",
                        icon: SizedBox(
                            height: 15.h,
                            width: 15.h,
                            child: Image.asset("assets/icons/search2.png"))),
                    BottomNavigationBarItem(
                        activeIcon: SizedBox(
                            height: 15.h,
                            width: 15.h,
                            child: Image.asset(
                              "assets/icons/play-circle1.png",
                              color: AppColors.primaryElement,
                            )),
                        label: "course",
                        icon: SizedBox(
                            height: 15.h,
                            width: 15.h,
                            child:
                                Image.asset("assets/icons/play-circle1.png"))),
                    BottomNavigationBarItem(
                        activeIcon: SizedBox(
                            height: 15.h,
                            width: 15.h,
                            child: Image.asset(
                              "assets/icons/person2.png",
                              color: AppColors.primaryElement,
                            )),
                        label: "profie",
                        icon: SizedBox(
                            height: 15.h,
                            width: 15.h,
                            child: Image.asset("assets/icons/person2.png")))
];
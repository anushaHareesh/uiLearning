import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ulearning/common/service/storage_service.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/common/values/constants.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_events.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBlocs, WelcomeStates>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 41.h),
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBlocs>(context).add(WelcomeEvents());
                  },
                  children: [
                    _page(
                        "Fisrt see Learning",
                        "Forget about a for of paper all knowledge in one learning .",
                        1,
                        "Next",
                        "assets/images/reading.png"),
                    _page(
                        "Connect with everyone",
                        "Always keep in touch with your tutor and friend ........",
                        2,
                        "Next",
                        "assets/images/boy.png"),
                    _page(
                        "Always Fascinated Learnig",
                        "Anywhere Any time .The time is at yours descretion.",
                        3,
                        "Get started",
                        "assets/images/man.png"),
                  ],
                ),
                Positioned(
                    bottom: 20.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                          color: Colors.blue, activeColor: Colors.red),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _page(
      String tit, String subtitle, int index, String btn, String image) {
    return Column(
      children: [
        SizedBox(
            width: 345.w,
            height: 345.h,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            )),
        Container(
          child: Text(
            tit,
            style: TextStyle(color: Colors.black, fontSize: 24.sp),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            print("index is------$index");
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.decelerate);
            } else {
              // StorageService().init();
              StorageService()
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);

              print(
                  "device open val----${StorageService().getDeviceFirstOpen()}");
              Navigator.pushNamedAndRemoveUntil(
                  context, "signin", (route) => false);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage(title: "snjd")));
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h),
            width: 325.w,
            height: 50.w,
            child: Center(
                child: Text(
              btn,
              style: TextStyle(fontSize: 17.sp, color: Colors.white),
            )),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 5))
                ],
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryElement),
          ),
        )
      ],
    );
  }
}

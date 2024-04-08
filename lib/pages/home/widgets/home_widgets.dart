import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_events.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';
import 'package:ulearning/pages/home/home_page.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      // height: 17.h,
      // width: 20.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 17.h,
              width: 20.w,
              child: Image.asset("assets/icons/menu.png")),
          Container(
              height: 24.h,
              width: 24.w,
              child: Image.asset("assets/icons/person.png"))
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color? color = AppColors.primaryText, int? top = 20}) {
  return Text(
    text,
    style:
        TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
  );
}

Widget searchView() {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          // margin: EdgeInsets.only(top: 10.h),
          height: 45.h,
          width: 280.w,
          child: TextField(
              decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5.h),
            hintText: "Search Your Course",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              Icons.search,
              size: 16.sp,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            ),
          )),
        ),
        Container(
          // alignment: Alignment.center,
          height: 45.h,
          width: 40.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.primaryElement),
          child: Image.asset("assets/icons/options.png"),
        )
      ],
    ),
  );
}

Widget sliderView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 10.h),
        height: 160.h,
        // width: double.infinity,
        child: PageView(
          onPageChanged: (value) {
            BlocProvider.of<HomepageBloc>(context).add(HomePageDots(value));
          },
          children: [
            sliderwidget(
              "assets/icons/Art.png",
            ),
            sliderwidget(
              "assets/icons/Image(1).png",
            ),
            sliderwidget(
              "assets/icons/Image(2).png",
            ),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
            color: Colors.blue,
            activeColor: Colors.red,
            size: Size.square(5),
            activeSize: Size(17.w, 5.h),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      )
    ],
  );
}

Widget sliderwidget(String img) {
  return Container(
    margin: EdgeInsets.only(left: 0.w, right: 5.w),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.h)),
    height: 160.h,
    width: 325.w,
    child: Image.asset(
      img,
      fit: BoxFit.fill,
    ),
  );
}

Widget menuView() {
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            menureusableText("Choose your course"),
            menureusableText("See All", color: Colors.grey, fontsize: 12),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Row(
            children: [
              couseContainer("All", color: Colors.white),
              couseContainer(
                "Popular",
                color: Colors.white,
              ),
              couseContainer("Newest", color: Colors.white),
            ],
          ),
        )
      ],
    ),
  );
}

Widget menureusableText(String text,
    {Color color = AppColors.primaryText, int fontsize = 16}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontsize.sp, color: color, fontWeight: FontWeight.bold),
  );
}

Widget couseContainer(String text,
    {Color color = AppColors.primaryText, int fontsize = 13}) {
  return Container(
    margin: EdgeInsets.only(right: 10.h),
    decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.circular(10.sp)),
    child: Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 8.h, bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontsize.sp, fontWeight: FontWeight.normal, color: color),
      ),
    ),
  );
}

Widget gridviewContainer() {
  return Container(
                          padding: EdgeInsets.all(12.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Best Course For IT',
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Flutter Best Course',
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        color: Colors.grey[200],
                                        fontWeight: FontWeight.bold,fontSize: 8.sp),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/Image(2).png"),
                                      fit: BoxFit.fill)),
                              // child: Image.asset("assets/icons/Image(1).png",fit: BoxFit.fill,),
                            );
}

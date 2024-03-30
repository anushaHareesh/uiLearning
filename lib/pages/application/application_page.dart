import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/application/application_widget.dart';
import 'package:ulearning/pages/application/bloc/application_blocs.dart';
import 'package:ulearning/pages/application/bloc/application_events.dart';
import 'package:ulearning/pages/application/bloc/application_states.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBlocs, ApplicationStates>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: Scaffold(
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ]),
              child: BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (val) {
                    BlocProvider.of<ApplicationBlocs>(context)
                        .add(TriggerAppEvent(val));
                    // setState(() {
                    //   index = val;
                    // });
                    print("index----$index");
                  },
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  iconSize: 24.0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                  items:bottomTabs),
            ),
            body: buildPages(state.index)),
      );
    });
  }
}

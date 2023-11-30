
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../app_color.dart';


class CustomTapWidget extends StatefulWidget {
  const CustomTapWidget({super.key});

  @override
  State<CustomTapWidget> createState() => _CustomTapWidgetState();
}

class _CustomTapWidgetState extends State<CustomTapWidget> {
  int _tapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
        unselectedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        // unselectedLabelStyle: TextStyle(color: AppColor.white),
        // contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        onTap: (p0) {
          setState(() {
            _tapIndex = p0;
          });
        },
        labelStyle:
            TextStyle(color: AppColor.lemonada, fontWeight: FontWeight.bold),
        tabs: [
          Tab(
              child: Container(
            alignment: Alignment.center,
            width: 100,
            decoration: BoxDecoration(
              color:
                  _tapIndex == 0 ? AppColor.scaffoldBG : AppColor.containerBG,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Science',
              style: TextStyle(
                color: _tapIndex == 0 ? AppColor.lemonada : AppColor.white,
              ),
            ),
          )),
          Tab(
              child: Container(
            alignment: Alignment.center,
            width: 100,
            decoration: BoxDecoration(
              color:
                  _tapIndex == 1 ? AppColor.scaffoldBG : AppColor.containerBG,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Sports',
              style: TextStyle(
                color: _tapIndex == 1 ? AppColor.lemonada : AppColor.white,
              ),
            ),
          )),
          Tab(
              child: Container(
            alignment: Alignment.center,
            width: 100,
            decoration: BoxDecoration(
              color:
                  _tapIndex == 2 ? AppColor.scaffoldBG : AppColor.containerBG,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Technology',
              style: TextStyle(
                color: _tapIndex == 2 ? AppColor.lemonada : AppColor.white,
              ),
            ),
          )),
          Tab(
              child: Container(
            alignment: Alignment.center,
            width: 100,
            decoration: BoxDecoration(
              color:
                  _tapIndex == 3 ? AppColor.scaffoldBG : AppColor.containerBG,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Business',
              style: TextStyle(
                color: _tapIndex == 3 ? AppColor.lemonada : AppColor.white,
              ),
            ),
          )),
        ]);
  }
}

import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as getx;
import 'package:sporty/main.dart';
import 'package:sporty/view/profile/screen/profile_screen.dart';
import 'package:sporty/view/settings/screen/settings_screen.dart';








class MainPageController extends getx.GetxController {

  //selected index
  getx.RxInt selectedIndex = 0.obs;

  //widget options
  final List<Widget> widgetOptions = <Widget>[
    ProfileScreen(),
    SizedBox(),
    SizedBox(),
    SettingsScreen()

    //BuddiesPage(),
    //DiscoverPage(),

  ];

  dynamic setIndex(int setindex) {
    selectedIndex.value = setindex;
    log("index: $setindex");
    update();
  }



  Future<void> navigateToMainpageAtIndex({required Widget page, required int index}) async{
    // Use Navigator to push to onto the navigation stack
    setIndex(index);
    navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      )
    );
  }



  //navbar items
  List<BottomNavigationBarItem> navBarsItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        activeIcon: Icon(
          size: 24.r,
          CupertinoIcons.person_fill
        ),
        icon: Icon(
          size: 24.r,
          CupertinoIcons.person
        ), 
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          size: 24.r,
          CupertinoIcons.group_solid
        ),
        icon: Icon(
          size: 24.r,
          CupertinoIcons.group
        ), 
        label: 'Buddies',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          size: 24.r,
          CupertinoIcons.compass_fill
        ),
        icon: Icon(
          size: 24.r,
          CupertinoIcons.compass
        ), 
        label: 'Discover',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          size: 24.r,
          CupertinoIcons.gear_solid
        ),
        icon: Icon(
          size: 24.r,
          CupertinoIcons.gear
        ), 
        label: 'Settings',
      ),
    ];
  }

}
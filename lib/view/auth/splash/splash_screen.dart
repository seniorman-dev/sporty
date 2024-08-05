import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sporty/utils/theme/app_theme.dart';






class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.route,});
  final String route;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //final authController = Get.put(AuthController());

  late Timer _timer;
  int _secondsRemaining = 4;

  @override
  void initState() {
    super.initState();
    startTimer();
    setStatusBarColor();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    resetStatusBarColor();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 1) {
          _secondsRemaining--;
          debugPrint("timer: $_secondsRemaining");
        } 
        else {
          // Timer reached 0 seconds, navigate to password expired screen
          timer.cancel(); // Stop the timer
          Get.offNamed(
            widget.route
          );
        }
      });
    });
  }


  void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set your desired color here
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColor.blackColor, //AppColor.whiteColor,
    ));
  }

  void resetStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,//AppColor.blueColorOpacity, // Set your desired color here
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColor.blackColor, //AppColor.whiteColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.40,),
            Image.asset(
              'assets/images/splash_icon.png',
              //height: 40.h,
              //width: 40.w,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
            SizedBox(height: 10.w,),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Spor',
                    style: GoogleFonts.roboto(
                      color: AppColor.mainColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  TextSpan(
                    text: 'ty.',
                    style: GoogleFonts.roboto(
                      color: AppColor.greenColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600
                    )
                  )
                ]
              )
            ),
            
          ],
        ),
      )
    );
  }
}
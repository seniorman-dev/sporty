import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sporty/utils/theme/app_theme.dart';
import 'package:sporty/view/settings/widget/settings_item.dart';







class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.bgColor,
        statusBarColor: AppColor.greenColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.bgColor,
        statusBarColor: AppColor.bgColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          //padding: EdgeInsets.symmetric(horizontal: 20.w),
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              //custom background
              SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      //height: 350.h, //370.h
                      height: MediaQuery.of(context).size.height * 0.52,
                      decoration: BoxDecoration(
                        color: AppColor.greenColor,  //greenColorDark,
                        // put the exact color later
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        )
                      ),
                    )
                  ],
                )
              ),

              //main body
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 65.r, //24.r,
                      backgroundColor: AppColor.bgColor,
                      child: CircleAvatar(
                        radius: 62.r, //24.r,
                        backgroundColor: AppColor.hintTextGreyColor.withOpacity(0.4),
                        backgroundImage: AssetImage("assets/images/lionel.jpg"),
                          /*child: Text(
                            'J',
                          style: GoogleFonts.poppins(
                            color: AppColor.blackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500
                          ),
                        ),*/
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Text(
                    "Sam Altman",
                    style: GoogleFonts.roboto(
                      color: AppColor.bgColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    "@Bigsammy",
                    style: GoogleFonts.roboto(
                      color: AppColor.bgColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),

                  //info buttons details
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    child: Container(             
                      //height: 209.h,
                      //width: 200.w,
                      padding: EdgeInsets.symmetric(
                        vertical: 30.h, //20.h
                        horizontal: 15.w  //15.h
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(20.r), //20.r
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0.1.r,
                            blurRadius: 8.0.r,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingItem(
                            icon: CupertinoIcons.padlock, 
                            onPressed: () {
                              //Get.to(() => const ChangePasswordScreen());
                            }, 
                            title: 'Change password',
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                          SettingItem(
                            icon: CupertinoIcons.mail, 
                            onPressed: () {
                              //Get.to(() => const UpdateEmailScreen());
                            }, 
                            title: 'Update email',
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                          SettingItem(
                            icon: CupertinoIcons.person, 
                            onPressed: () {
                              //Get.to(() => const UpdateUsernameScreen());
                            }, 
                            title: 'Update username',
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                          SettingItem(
                            icon: CupertinoIcons.square_arrow_right,
                            onPressed: () {
                              //logout dialogue
                            }, 
                            title: 'Logout',
                          ),
                        ]
                      )
                    )
                  )

                ]
              ),
            ],
          )
        )
      )
    );
  }
}
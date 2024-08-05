import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sporty/controllers/controllers/profile/profile_controller.dart';
import 'package:sporty/utils/theme/app_theme.dart';
import 'package:sporty/view/profile/widget/profile_item.dart';
import 'package:sporty/view/profile/widget/user_interest.dart';








class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.bgColor,
        statusBarColor: Colors.transparent,
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
          physics: const BouncingScrollPhysics(),  //ClampingScrollPhysics(),
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
                      height: MediaQuery.of(context).size.height * 0.40,
                      decoration: BoxDecoration(
                        color: AppColor.greenColor.withOpacity(0.2),
                        image: DecorationImage(
                          image: AssetImage("assets/images/messi.png"),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover
                        ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  //SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  

                  SizedBox(height: MediaQuery.of(context).size.height * 0.20),

                  //personal details
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 15.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileItem(
                          icon: CupertinoIcons.circle, 
                          title: '@Bigsammy23',
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                        ProfileItem(
                          icon: CupertinoIcons.phone, 
                          title: '+1 7040571471',
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                        ProfileItem(
                          icon: CupertinoIcons.mail, 
                          title: 'samaltman@openai.com',
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                      ]
                    )
                  ),

                  //SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 5.h,
                    ),
                    child: Text(
                      "Sport Interests",
                      style: GoogleFonts.roboto(
                        color: AppColor.mainColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  //GRID VIEW OF USER SPORT INTERESTS
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 5.h,
                    ),
                    child: UserSportInterestGrid(),
                  ),
                  
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),


                ]
              ),
            ],
          )
        )
      )
    );
  }
}
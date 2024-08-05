import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sporty/controllers/controllers/auth/auth_controller.dart';
import 'package:sporty/utils/theme/app_theme.dart';








class SportInterestScreen extends StatefulWidget {
  const SportInterestScreen({super.key,});

  @override
  State<SportInterestScreen> createState() => _SportInterestScreenState();
}

class _SportInterestScreenState extends State<SportInterestScreen> {

  final authController = Get.put(AuthController());
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h, //200.h
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 30, //10,
          mainAxisSpacing: 20, //10,
          childAspectRatio: 0.35, //0.3 Adjust this ratio as needed to control the item size
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: authController.interestList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        //padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                if (authController.selectedInterestList.contains(authController.interestList[index])) {
                  authController.selectedInterestList.remove(authController.interestList[index]);
                  debugPrint("selected sport interest: ${authController.selectedInterestList}");
                } 
                else {
                  authController.selectedInterestList.add(authController.interestList[index]);
                  debugPrint("selected sport interests: ${authController.selectedInterestList}");
                }
              });
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              height: 40.h,
              //width: 180.w,
              //width: index.isEven ? 80.w : 160.w,
              decoration: BoxDecoration(          
                color: authController.selectedInterestList.contains(authController.interestList[index]) ? AppColor.greenColor.withOpacity(0.1) : AppColor.fieldGreyColor,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: authController.selectedInterestList.contains(authController.interestList[index]) ? AppColor.mainColor : AppColor.fieldGreyColor
                )
              ),
              child: Text(
                authController.interestList[index],  //${index}
                style: GoogleFonts.poppins(
                  color: authController.selectedInterestList.contains(authController.interestList[index]) ? AppColor.mainColor : AppColor.mainColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              )
            ),
          );
        }
      ),
    );
  }
}
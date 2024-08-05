import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sporty/controllers/controllers/profile/profile_controller.dart';
import 'package:sporty/utils/theme/app_theme.dart';








class UserSportInterestGrid extends StatefulWidget {
  const UserSportInterestGrid({super.key,});

  @override
  State<UserSportInterestGrid> createState() => _UserSportInterestGridState();
}

class _UserSportInterestGridState extends State<UserSportInterestGrid> {

  final profileController = Get.put(ProfileController());
  
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
        itemCount: profileController.interestList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        //padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                if (profileController.selectedInterestList.contains(profileController.interestList[index])) {
                  profileController.selectedInterestList.remove(profileController.interestList[index]);
                  debugPrint("selected sport interest: ${profileController.selectedInterestList}");
                } 
                else {
                  profileController.selectedInterestList.add(profileController.interestList[index]);
                  debugPrint("selected sport interests: ${profileController.selectedInterestList}");
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
                color: profileController.selectedInterestList.contains(profileController.interestList[index]) ? AppColor.greenColor.withOpacity(0.1) : AppColor.fieldGreyColor,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: profileController.selectedInterestList.contains(profileController.interestList[index]) ? AppColor.mainColor : AppColor.fieldGreyColor
                )
              ),
              child: Text(
                profileController.interestList[index],  //${index}
                style: GoogleFonts.poppins(
                  color: profileController.selectedInterestList.contains(profileController.interestList[index]) ? AppColor.mainColor : AppColor.mainColor,
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sporty/utils/theme/app_theme.dart';






class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.icon, required this.title,});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50.h,
          width: 40.w,
          alignment: Alignment.center,
          /*padding: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 18.w
          ),*/
          decoration: BoxDecoration(
            color: AppColor.greenColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
            /*boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0.1.r,
                blurRadius: 8.0.r,
              )
            ],*/
            //border: Border.all(color: AppTheme.opacityOfMainColor, width: 2)
          ),
          child: Icon(
            icon,
            color: AppColor.greenColor,
          )                   
        ),
        SizedBox(width: 20.w,),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.roboto(
              color: AppColor.mainColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
            ),
          )
        ),
  
      ],
    );
  }
}
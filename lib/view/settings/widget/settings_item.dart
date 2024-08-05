import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sporty/utils/theme/app_theme.dart';






class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.icon, required this.title, required this.onPressed});
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
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
          Icon(
            CupertinoIcons.forward,
            color: AppColor.mainColor,
            size: 20.r,
          )
        ],
      ),
    );
  }
}
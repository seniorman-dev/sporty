import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sporty/utils/theme/app_theme.dart';









class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //SizedBox(height: 20.h,), //20.h
        SvgPicture.asset(
          'assets/svg/sports.svg',
          height: 300.h, //350.h
          width: double.infinity,
          fit: BoxFit.contain,
          //filterQuality: FilterQuality.high
        ),
          
        SizedBox(height: 30.h,),
    
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Fantasy games to keep the vibe up',
                  style: GoogleFonts.roboto(
                    color: AppColor.mainColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600
                  )
                ),
              ]
            )
          ),
        ),
        SizedBox(height: 30.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "Organize fantasy games together with your buddies on the go",
            style: GoogleFonts.roboto(
              color: AppColor.textGreyColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.center,
          ),
        ),
        //SizedBox(height: MediaQuery.of(context).size.height * 0.035),       
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sporty/controllers/controllers/auth/auth_controller.dart';
import 'package:sporty/controllers/repository/auth/auth_service.dart';
import 'package:sporty/utils/components/buttons/auth_button.dart';
import 'package:sporty/utils/components/buttons/back_button.dart';
import 'package:sporty/utils/components/buttons/country_button.dart';
import 'package:sporty/utils/components/country_code_widget.dart';
import 'package:sporty/utils/components/loader.dart';
import 'package:sporty/utils/components/my_snackbar.dart';
import 'package:sporty/utils/theme/app_theme.dart';
import 'package:sporty/view/auth/login/widget/auth_textfield.dart';
import 'package:sporty/view/auth/register/widget/interest_list.dart';
import 'package:sporty/view/routes/web_routes.dart';







class ChooseInterestScreen extends StatelessWidget {
  ChooseInterestScreen({super.key});

  final authController = Get.put(AuthController());
  final authService = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //5% of the screen
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),  //0.08
              
              /*SvgPicture.asset(
                'assets/svg/back_icon.svg',
                height: 55.h,
                width: 55.w,
                fit: BoxFit.contain,
              ),*/
              CustomBackButton(
                onTap: () {
                  Get.back();
                  //Get.offNamed(VerifyEmailPageRoute);
                },
              ),
                      
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 

              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Almost there! select your\n',
                      style: GoogleFonts.roboto(
                        color: AppColor.mainColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    TextSpan(
                      text: 'sport ',
                      style: GoogleFonts.roboto(
                        color: AppColor.mainColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    TextSpan(
                      text: 'interests',
                      style: GoogleFonts.roboto(
                        color: AppColor.greenColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ]
                )
              ),
      
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.05), 
        
              //SPORT INTEREST GRID View
              SportInterestScreen(),

              SizedBox(height: MediaQuery.of(context).size.height * 0.35),

              Obx(
                () {
                  return authService.isLoading.value ? Loader2() :  AuthButton(
                    onPressed: () {

                      if(
                        authController.selectedInterestList.isNotEmpty
                      ) {
                        //call the registeration endpoint
                        Get.toNamed(
                          CongratulationsPageRoute,
                          arguments: {}
                        );
                      }
                      else{
                        showMessagePopup(
                          title: 'Uh oh!', 
                          message: 'please select sport interest', 
                          buttonText: 'Okay', 
                          context: context
                        );
                      }
                      
                    }, 
                    backgroundColor: AppColor.mainColor, 
                    text: 'Create account', 
                    textColor: AppColor.whiteColor
                  );
                }
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
            ]
          ),          
        
        ),
      )
    );
  }
}
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
import 'package:sporty/view/routes/web_routes.dart';







class MoreDetailsScreen extends StatelessWidget {
  MoreDetailsScreen({super.key});

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
                      text: 'Hey there! tell us a bit\n',
                      style: GoogleFonts.roboto(
                        color: AppColor.mainColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    TextSpan(
                      text: 'about ',
                      style: GoogleFonts.roboto(
                        color: AppColor.mainColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    TextSpan(
                      text: 'yourself',
                      style: GoogleFonts.roboto(
                        color: AppColor.greenColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ]
                )
              ),
      
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
        
              //full name field
              AuthTextField(
                onChanged: (val) {},
                hintText: 'Full name',
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                textController: authController.fullNameController,
                validator: (val) => authController.validateFullName(value: val!)
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
               //full name field
              AuthTextField(
                onChanged: (val) {},
                hintText: 'Username',
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                textController: authController.usernameController,
                validator: (val) => authController.validateUserName(value: val!)
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              //phone field
              AuthPhoneNumberTextField(
                onChanged: (val) {},
                hintText: "Phone",
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                textController: authController.phoneNumberController,
                validator: (val) => authController.validatePhoneNumber(value: val!),
                icon: CountryCodeWidget(
                  onCountryChanged: (val) => authController.onCountryChange(val)
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              //select country fiel field
              /*CountryButton(
                countryValue: authController.selectCountryController,
                onTap: () {
                  authController.chooseCountry(
                    context: context, 
                    selectedCountry: authController.selectCountryController
                  );
                },
              ),*/
      
              SizedBox(height: MediaQuery.of(context).size.height * 0.02), 
              //password field
              AuthPasswordTextField(
                onChanged: (val) {},
                hintText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                textController: authController.passwordController,
                isObscured: false,
                validator: (val) => authController.validatePassword(value: val!),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02), 
              //confirm password field
              AuthPasswordTextField(
                onChanged: (val) {},
                hintText: 'Confirm Password',
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                textController: authController.confirmPasswordController,
                isObscured: false,
                validator: (val) => authController.validateConfirmPassword(firstValue: authController.passwordController.text, secondValue: val!),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.11),

              Obx(
                () {
                  return authService.isLoading.value ? Loader2() :  AuthButton(
                    onPressed: () {

                      if(
                        authController.fullNameController.text.isNotEmpty 
                      && authController.usernameController.text.isNotEmpty
                      && authController.emailController.text.isNotEmpty
                      && authController.selectCountryController.value.isNotEmpty
                      && authController.phoneNumberController.text.isNotEmpty
                      && authController.passwordController.text.isNotEmpty
                      && authController.confirmPasswordController.text.isNotEmpty
                      ) {
                        //call the registeration endpoint
                        Get.toNamed(
                          ChooseInterestPageRoute,
                          arguments: {}
                        );
                      }
                      else{
                        showMessagePopup(
                          title: 'Uh oh!', 
                          message: 'please enter required credentials', 
                          buttonText: 'Okay', 
                          context: context
                        );
                      }
                      
                    }, 
                    backgroundColor: AppColor.mainColor, 
                    text: 'Next', 
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
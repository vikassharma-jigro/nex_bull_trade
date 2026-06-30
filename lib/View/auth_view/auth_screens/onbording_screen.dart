import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nax_bull_trade/app_helpers/utils/app_images.dart';

import '../../../app_helpers/theme/app_colors.dart';
import '../../../app_helpers/utils/custom_text.dart';
import '../../../app_helpers/utils/font_family.dart';
import 'onboarding2_screen.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.onGraphIcon),

            SizedBox(height: 10,),
            text("Secure Financial Mastery",
                fontSize: 28,fontFamily: FontFamily.poppinsRegular,
                fontWeight: FontWeight.w600,
                textColor: AppColors.blackColor
            ),
            SizedBox(height: 10,),
            text("Experience the next generation of institutional-grade trading tools designed for everyone. Fast, secure, and intuitive.",
                fontSize: 14,fontFamily: FontFamily.poppinsRegular,
                fontWeight: FontWeight.w300,
                textColor: AppColors.blackColor
            ),
            SizedBox(height: 20,),
            CommonButton(
              text: "Get Started",
              color: AppColors.darkBlue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding2Screen(),));
              },
              fontFamily: FontFamily.poppinsBold,
              fontWeight: FontWeight.w600,
              textColor: AppColors.onPrimary,
            ),

            SizedBox(height: 20,),
            CommonButton(
              text: "Login",
              color: AppColors.lightWhiteColor,
              onPressed: (){

              },
              fontFamily: FontFamily.poppinsRegular,
              fontWeight: FontWeight.w400,
              textColor: AppColors.blackColor,
            )

          ],
        ),
      ),
    );
  }
}

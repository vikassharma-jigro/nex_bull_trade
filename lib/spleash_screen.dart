import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nax_bull_trade/View/auth_view/auth_screens/onbording_screen.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/custom_text.dart';
import 'package:nax_bull_trade/app_helpers/utils/font_family.dart';
import '../main.dart';
import 'app_helpers/utils/app_images.dart';
import 'app_helpers/utils/shared_preferences.dart';

class FirstSplash extends StatefulWidget {
  const FirstSplash({super.key});

  @override
  State<FirstSplash> createState() => _FirstSplashState();
}

class _FirstSplashState extends State<FirstSplash> {
  //bool isLogged = sp?.getBool(SpUtil.IS_LOGIN) ?? false;
  bool isSlider = sp?.getBool(SpUtil.IS_SLIDER_SHOWN) ?? false;
  @override
  void initState() {
    didChangeDependencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(AppImages.splashIcon),
              width: 225,
              fit: BoxFit.cover,
            ),
          ),
          text("NAXBull",
          fontSize: 25,fontFamily: FontFamily.poppinsRegular,
            fontWeight: FontWeight.w700,
            textColor: AppColors.darkBlue
          ),
          SizedBox(height: 10,),
          text("Trade Smarter. Grow Faster.",
          fontSize: 14,fontFamily: FontFamily.poppinsRegular,
            fontWeight: FontWeight.w300,
            textColor: AppColors.textDark
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool? isLogin = sp?.getBool(SpUtil.IS_LOGGED_IN) ?? false;
    // bool? isSlider = sp?.getBool(SpUtil.IS_SLIDER_SHOWN) ?? false;
    // int? isProfile = sp?.getInt(SpUtil.isPROFILE) ?? 0;

    Timer(
        const Duration(seconds: 4),
            () => /*isSlider
            ? isLogged*/
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnbordingScreen())),
            // : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginAccount()))
            // : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingScreen()))
        );

    super.didChangeDependencies();
  }
}

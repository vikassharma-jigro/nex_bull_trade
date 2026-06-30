import 'package:flutter/material.dart';
import 'package:nax_bull_trade/View/auth_view/auth_screens/kyc_screen.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/custom_text.dart';
import 'package:nax_bull_trade/app_helpers/utils/font_family.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FF),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonButton(
              text: "Verify OTP",
              color: AppColors.darkBlue,
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => KycScreen(),));
              },
              fontFamily: FontFamily.poppinsBold,
              fontWeight: FontWeight.w600,
              textColor: AppColors.onPrimary,
            ),


            const SizedBox(height: 20),

             text(
              "By clicking verify, you agree to our terms of service regarding account security and transaction protocols.",
              textAlign: TextAlign.center,
             fontWeight: FontWeight.w300,
               fontFamily: FontFamily.poppinsRegular,
               textColor: AppColors.textDark,
               fontSize: 13
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F9FF),
        elevation: 0,
        centerTitle: true,
        title:  text(
          "NAXBull",
         fontSize: 20,fontFamily: FontFamily.poppinsBold,
          fontWeight: FontWeight.w600,textColor: AppColors.darkBlue
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 30),

            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: const Color(0xffE8EEFF),
                borderRadius: BorderRadius.circular(40),
              ),
              child:  Icon(
                Icons.shield,
                size: 40,
                color: AppColors.darkBlue
              ),
            ),

            const SizedBox(height: 25),

             text(
              "Verify Account",
                 fontSize: 28,fontFamily: FontFamily.poppinsBold,
                 fontWeight: FontWeight.w600,textColor: AppColors.blackColor
            ),

            const SizedBox(height: 10),

             text(
              "Enter the 6-digit verification code sent to",
                 fontSize: 16,fontFamily: FontFamily.poppinsRegular,
                 fontWeight: FontWeight.w400,textColor: AppColors.textDark
            ),

            const SizedBox(height: 5),

             text(
              "+1 ••• ••• 4290",
                 fontSize: 16,fontFamily: FontFamily.poppinsBold,
                 fontWeight: FontWeight.w500,textColor: AppColors.blackColor
            ),

            const SizedBox(height: 40),

            Pinput(
              length: 6,
              defaultPinTheme: PinTheme(
                width: 55,
                height: 60,
                textStyle: const TextStyle(fontSize: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.timer_outlined),
                SizedBox(width: 5),
                Text(
                  "Code expires in ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "00:57",
                  style: TextStyle(
                    color: Color(0xff1652D4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            const Text.rich(
              TextSpan(
                text: "Didn't receive the code? ",
                children: [
                  TextSpan(
                    text: "Resend OTP",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
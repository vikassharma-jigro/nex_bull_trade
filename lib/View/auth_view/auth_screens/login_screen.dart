import 'package:flutter/material.dart';
import 'package:nax_bull_trade/View/auth_view/auth_screens/otp_screen.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/font_family.dart';

import '../../../app_helpers/utils/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FF),
      bottomNavigationBar:   Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: text(
                "© 2024 NAXBull Financial Services Inc.\nLicensed & Regulated Provider",
                textAlign: TextAlign.center,
                fontFamily: FontFamily.poppinsMedium,
                fontSize: 15,textColor: AppColors.textDark
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 50),

                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.trending_up,
                    color: Colors.white,
                    size: 40,
                  ),
                ),

                const SizedBox(height: 20),

                 text(
                  "NAXBull",
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                 textColor: AppColors.darkBlue,
                   fontFamily: FontFamily.poppinsBold
                ),

                const SizedBox(height: 8),

                 text(
                  "Secure high-trust financial engineering",
                     fontSize: 16,
                     fontWeight: FontWeight.w300,
                     textColor: AppColors.textDark,
                     fontFamily: FontFamily.poppinsRegular
                ),

                const SizedBox(height: 30),

                Container(
                  //margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12,
                        color: Colors.black.withOpacity(.05),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       text(
                        "MOBILE NUMBER",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.textDark,
                    fontFamily: FontFamily.poppinsRegular,
                        latterSpacing: 1,

                      ),

                      const SizedBox(height: 15),

                      TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          hintText: "Enter Mobile No.",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (v) {
                              setState(() {
                                isChecked = v!;
                              });
                            },
                          ),
                          const Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: "I agree to the ",
                                children: [
                                  TextSpan(
                                    text: "Terms of Service",
                                    style: TextStyle(
                                      color: Color(0xff1652D4),
                                    ),
                                  ),
                                  TextSpan(text: " and "),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(
                                      color: Color(0xff1652D4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 20),

                      CommonButton(
                        text: "Continue",
                        color: AppColors.darkBlue,
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => OtpScreen(),));
                        },
                        fontFamily: FontFamily.poppinsBold,
                        fontWeight: FontWeight.w600,
                        textColor: AppColors.onPrimary,
                      ),

                      const SizedBox(height: 35),

                      const Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: Color(0xff1652D4),
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),




                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
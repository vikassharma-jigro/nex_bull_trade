import 'package:flutter/material.dart';
import 'package:nax_bull_trade/View/dashboard_view/screens/bottomNavigation_screen.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/custom_text.dart';
import 'package:nax_bull_trade/app_helpers/utils/font_family.dart';

class KycScreen extends StatelessWidget {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                   Expanded(
                     child: text(
                      "NAXBull",
                      isCentered: true,
                      textColor: AppColors.darkBlue,
                       fontSize: 25,fontFamily: FontFamily.poppinsBold,
                       fontWeight: FontWeight.w600),
                   ),
                ],
              ),

              const SizedBox(height: 30),

               text(
                "Verify your Identity",
                   textColor: AppColors.blackColor,
                   fontSize: 20,fontFamily: FontFamily.poppinsBold,
                   fontWeight: FontWeight.w600
              ),

              const SizedBox(height: 10),

               text(
                "To comply with financial regulations and ensure the security of your account.",
                  textColor: AppColors.textDark,
                  fontSize: 15,fontFamily: FontFamily.poppinsRegular,
                  fontWeight: FontWeight.w300
              ),

              const SizedBox(height: 35),

              buildField(
                label: "FULL NAME (AS PER PAN)",
                hint: "Johnathan Doe",
                icon: Icons.person_outline,
              ),

              buildField(
                label: "DATE OF BIRTH",
                hint: "mm/dd/yyyy",
                icon: Icons.calendar_month_outlined,
              ),

              buildField(
                label: "PAN NUMBER",
                hint: "ABCDE1234F",
                icon: Icons.badge_outlined,
              ),

              buildField(
                label: "AADHAAR NUMBER",
                hint: "0000 0000 0000",
                icon: Icons.fingerprint,
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.green.withOpacity(.4),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.shield_outlined,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: "Encrypted & Secure\n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            TextSpan(
                              text:
                              "Your data is stored with bank-grade encryption.",
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              CommonButton(
                text: "Continue",
                color: AppColors.darkBlue,
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardScreen(),));
                },
                fontFamily: FontFamily.poppinsBold,
                fontWeight: FontWeight.w600,
                textColor: AppColors.onPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(
            label,
              textColor: AppColors.textDark,
              fontSize: 13,fontFamily: FontFamily.poppinsBold,
              fontWeight: FontWeight.w600
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: Icon(icon),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
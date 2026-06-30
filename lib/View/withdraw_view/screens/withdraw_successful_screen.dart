import 'package:flutter/material.dart';
import 'package:nax_bull_trade/View/withdraw_view/screens/review_withdrawal_screen.dart';

import '../../../app_helpers/theme/app_colors.dart';
import '../../../app_helpers/utils/custom_text.dart';
import '../../../app_helpers/utils/font_family.dart';

class WithdrawSuccessScreen extends StatelessWidget {
  const WithdrawSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title:  text(
          "Withdrawal Successful",
            textColor: AppColors.blackColor,
            fontSize: 18,
            latterSpacing: .5,
            fontFamily: FontFamily.poppinsBold,
            fontWeight: FontWeight.w600
        ),
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CommonButton(
              text: "Done",
              color: AppColors.darkBlue,
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => ReviewWithdrawalScreen(),));
              },
              fontFamily: FontFamily.poppinsBold,
              fontWeight: FontWeight.w600,
              textColor: AppColors.onPrimary,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            const SizedBox(height: 10),

            Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                color: Color(0xff63E57B),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xff007A33),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 34,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

             text(
              "Withdrawal Initiated\nSuccessfully",
              textAlign: TextAlign.center,
                 textColor: AppColors.blackColor,
                 fontSize: 25,
                 isCentered: true,
                 fontFamily: FontFamily.poppinsBold,
                 fontWeight: FontWeight.w600
            ),

            const SizedBox(height: 15),

             text(
              "Your funds are being securely\ntransferred to your bank account.",
              textAlign: TextAlign.center,
                 textColor: AppColors.grey600,
                 fontSize: 14,
                 latterSpacing: 1,
                 fontFamily: FontFamily.poppinsRegular,
                 fontWeight: FontWeight.w400
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                       Expanded(
                        child: text(
                          "TRANSACTION RECEIPT",
                            textColor: AppColors.grey600,
                            fontSize: 14,
                            fontFamily: FontFamily.poppinsMedium,
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      Icon(
                        Icons.receipt_long_outlined,
                        color: Colors.grey.shade700,
                      )
                    ],
                  ),

                  const SizedBox(height: 25),

                   Center(
                    child: text(
                      "Amount Withdrawn",
                        textColor: AppColors.grey600,
                        fontSize: 14,
                        fontFamily: FontFamily.poppinsMedium,
                        fontWeight: FontWeight.w600
                    ),
                  ),

                  const SizedBox(height: 8),

                   Center(
                    child: text(
                      "\$5,000.00",
                        textColor: AppColors.blackColor,
                        fontSize: 19,
                        fontFamily: FontFamily.poppinsBold,
                        fontWeight: FontWeight.w600
                    ),
                  ),

                  const SizedBox(height: 15),

                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Icon(
                            Icons.circle,
                            color: Colors.blue,
                            size: 8,
                          ),

                          SizedBox(width: 8),

                          text(
                            "Processing",
                              textColor: AppColors.darkBlue,
                              fontSize: 14,
                              latterSpacing: 1,
                              fontFamily: FontFamily.poppinsBold,
                              fontWeight: FontWeight.w600
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Divider(),

                  buildRow(
                    "Transaction ID",
                    "TXN-W98721-NB",
                  ),

                  buildRow(
                    "Bank Account",
                    "HDFC Bank (****9876)",
                  ),

                  buildRow(
                    "Date & Time",
                    "Today, 11:30 AM",
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  const SizedBox(height: 15),

                   Center(
                    child: text(
                      "The amount should reflect in your account\nwithin 2-4 business hours.",
                      textAlign: TextAlign.center,
                        textColor: AppColors.grey600,
                        fontSize: 14,
                        fontFamily: FontFamily.poppinsRegular,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child:  Row(
                children: [

                  CircleAvatar(
                    backgroundColor: Color(0xffEDF3FF),
                    child: Icon(
                      Icons.support_agent,
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        text(
                          "Need help?",
                            textColor: AppColors.blackColor,
                            fontSize: 14,
                            fontFamily: FontFamily.poppinsBold,
                            fontWeight: FontWeight.w600
                        ),

                        SizedBox(height: 3),

                        text(
                          "Contact our 24/7 support team",
                            textColor: AppColors.grey600,
                            fontSize: 13,
                            fontFamily: FontFamily.poppinsRegular,
                            fontWeight: FontWeight.w600
                        ),
                      ],
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios, size: 18)
                ],
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Row(
        children: [

          Expanded(
            child: text(
              title,
                textColor: AppColors.grey600,
                fontSize: 14,
                fontFamily: FontFamily.poppinsMedium,
                fontWeight: FontWeight.w600
            ),
          ),

          text(
            value,
              textColor: AppColors.blackColor,
              fontSize: 14,
              fontFamily: FontFamily.poppinsBold,
              fontWeight: FontWeight.w600
          ),
        ],
      ),
    );
  }
}
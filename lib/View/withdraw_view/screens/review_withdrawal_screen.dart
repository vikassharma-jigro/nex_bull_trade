import 'package:flutter/material.dart';
import 'package:nax_bull_trade/app_helpers/utils/custom_text.dart';

import '../../../app_helpers/theme/app_colors.dart';
import '../../../app_helpers/utils/font_family.dart';

class ReviewWithdrawalScreen extends StatelessWidget {
  const ReviewWithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const amount = 5000.00;
    const fee = 2.00;
    const receivable = amount - fee;

    return Scaffold(
      backgroundColor: const Color(0xffF6F8FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title:  text(
          'Review Withdrawal',
            textColor: AppColors.blackColor,
            fontSize: 18,
            isCentered: true,
            fontFamily: FontFamily.poppinsBold,
            fontWeight: FontWeight.w600
        ),
        leading: const BackButton(color: Colors.black),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2962FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child:  Text(
                'Confirm Withdrawal',
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children:  [
                text("TOTAL RECEIVABLE",
                    textColor: AppColors.onPrimary,
                    fontSize: 17,
                    isCentered: true,
                    fontFamily: FontFamily.poppinsBold,
                    fontWeight: FontWeight.w600
                ),
                SizedBox(height: 10),
                text("\$4,998.00",
                    textColor: AppColors.onPrimary,
                    fontSize: 25,
                    isCentered: true,
                    fontFamily: FontFamily.poppinsBold,
                    fontWeight: FontWeight.w600

                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  row("Withdrawal Amount","\$${amount.toStringAsFixed(2)}"),
                  const Divider(),
                  row("Network Fee","-\$${fee.toStringAsFixed(2)}"),
                  const Divider(),
                  row("You Receive","\$${receivable.toStringAsFixed(2)}", true),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child:  Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text("Destination",
                      textColor: AppColors.blackColor,
                      fontSize: 16,
                      isCentered: true,
                      fontFamily: FontFamily.poppinsBold,
                      fontWeight: FontWeight.w500),
                  SizedBox(height: 16),
                  ListTile(
                    leading: CircleAvatar(child: Icon(Icons.account_balance)),
                    title: text("HDFC Bank",
                        textColor: AppColors.grey600,
                        fontSize:16,
                        fontFamily: FontFamily.poppinsRegular,
                        fontWeight: FontWeight.w500
                    ),
                    subtitle: text("Alexander Sterling\n****9876",
                        textColor: AppColors.grey600,
                        fontSize: 16,
                        fontFamily: FontFamily.poppinsMedium,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child:  Row(
              children: [
                Icon(Icons.schedule,color: Colors.orange),
                SizedBox(width: 12),
                Expanded(child: text("Estimated settlement: 1-2 business days.",
                    textColor: AppColors.blackColor,
                    fontSize: 14,
                    isCentered: true,
                    fontFamily: FontFamily.poppinsRegular,
                    fontWeight: FontWeight.w500
                )),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child:  Row(
              children: [
                Icon(Icons.verified_user,color: Colors.green),
                SizedBox(width: 12),
                Expanded(child: text("Your withdrawal is protected with bank-grade SSL encryption.",
                    textColor: AppColors.blackColor,
                    fontSize: 14,
                    isCentered: true,
                    fontFamily: FontFamily.poppinsRegular,
                    fontWeight: FontWeight.w400
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget row(String l,String r,[bool bold=false]){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          text(l,
              textColor: AppColors.grey600,
              fontSize: 15,
              isCentered: true,
              fontFamily: FontFamily.poppinsRegular,
              fontWeight: FontWeight.w500
          ),
          text(r,
              textColor: AppColors.blackColor,
              fontSize: bold?18:16,
              isCentered: true,
              fontFamily: FontFamily.poppinsBold,
              fontWeight: FontWeight.w500
             ),
        ],
      ),
    );
  }
}

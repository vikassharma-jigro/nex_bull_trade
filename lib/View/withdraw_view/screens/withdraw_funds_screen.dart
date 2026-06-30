import 'package:flutter/material.dart';
import 'package:nax_bull_trade/View/withdraw_view/screens/withdraw_successful_screen.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/custom_text.dart';
import 'package:nax_bull_trade/app_helpers/utils/font_family.dart';

class WithdrawFundsScreen extends StatefulWidget {
  const WithdrawFundsScreen({super.key});

  @override
  State<WithdrawFundsScreen> createState() => _WithdrawFundsScreenState();
}

class _WithdrawFundsScreenState extends State<WithdrawFundsScreen> {
  final TextEditingController holderController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  double availableBalance = 12450.80;
  double withdrawalFee = 2.00;
  double totalReceivable = 0.00;

  void calculateAmount() {
    double amount = double.tryParse(amountController.text) ?? 0;

    setState(() {
      if (amount <= 0) {
        totalReceivable = 0;
      } else {
        totalReceivable = amount - withdrawalFee;

        if (totalReceivable < 0) {
          totalReceivable = 0;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    amountController.addListener(calculateAmount);
  }

  @override
  void dispose() {
    holderController.dispose();
    ifscController.dispose();
    accountController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title:  text(
          "Withdraw Funds",
          textColor: AppColors.blackColor,
          fontSize: 18,
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
              text: "Withdraw Money",
              color: AppColors.darkBlue,
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => WithdrawSuccessScreen(),));
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff2962FF),
                    Color(0xff3D7BFF),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                   text(
                    "AVAILABLE BALANCE",
                       textColor: AppColors.onPrimary,
                       fontSize: 14,
                       latterSpacing: 1,
                       fontFamily: FontFamily.poppinsBold,
                       fontWeight: FontWeight.w600
                  ),

                  const SizedBox(height: 10),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                          "\$${availableBalance.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: " USD",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.verified_user,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        text(
                          "Secured by NAXGuard Encryption",
                            textColor: AppColors.onPrimary,
                            fontSize: 13,
                            fontFamily: FontFamily.poppinsRegular,
                            fontWeight: FontWeight.w600
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            buildLabel("ACCOUNT HOLDER NAME"),

            buildField(
              controller: holderController,
              hint: "ALEXANDER STERLING",
            ),

            const SizedBox(height: 18),

            buildLabel("IFSC CODE"),

            buildField(
              controller: ifscController,
              hint: "HDFC0000123",
            ),

            const SizedBox(height: 18),

            buildLabel("ACCOUNT NUMBER"),

            buildField(
              controller: accountController,
              hint: "Enter full account number",
            ),

            const SizedBox(height: 18),

            buildLabel("WITHDRAWAL AMOUNT"),

            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [

                  const SizedBox(width: 16),

                  const Text(
                    "\$",
                    style: TextStyle(fontSize: 22),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "0.00",
                        hintStyle: TextStyle(
                          color: AppColors.grey600,
                          fontFamily: FontFamily.poppinsMedium,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        amountController.text =
                            availableBalance.toStringAsFixed(2);
                      },
                      child:  text("MAX",
                          textColor: AppColors.darkBlue,
                          fontSize: 14,
                          fontFamily: FontFamily.poppinsBold,
                          fontWeight: FontWeight.w600
                      ),
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
              ),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [

                       text(
                        "Withdrawal Fee",
                           textColor: AppColors.blackColor,
                           fontSize: 14,
                           fontFamily: FontFamily.poppinsBold,
                           fontWeight: FontWeight.w600
                      ),

                      text(
                        "-\$${withdrawalFee.toStringAsFixed(2)}",
                          textColor: Colors.red,
                          fontSize: 18,
                          fontFamily: FontFamily.poppinsBold,
                          fontWeight: FontWeight.w600
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [

                       text(
                        "Total Receivable",
                           textColor: AppColors.blackColor,
                           fontSize: 16,
                           fontFamily: FontFamily.poppinsBold,
                           fontWeight: FontWeight.w600
                      ),

                      text(
                        "\$${totalReceivable.toStringAsFixed(2)}",
                          textColor: AppColors.kpi,
                          fontSize: 14,
                          fontFamily: FontFamily.poppinsBold,
                          fontWeight: FontWeight.w600
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                   Row(
                    children: [

                      Icon(
                        Icons.access_time,
                        size: 18,
                        color: Colors.grey,
                      ),

                      SizedBox(width: 2),

                      text(
                        "Estimated Settlement : 1-2 Business Days",
                          textColor: AppColors.grey600,
                          fontSize: 12,
                          fontFamily: FontFamily.poppinsBold,
                          fontWeight: FontWeight.w600
                      )
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: text(
        title,
          textColor: AppColors.blackColor,
          fontSize: 15,
          latterSpacing: 1,
          fontFamily: FontFamily.poppinsBold,
          fontWeight: FontWeight.w600
      ),
    );
  }

  Widget buildField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
          BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
          BorderSide(color: Colors.grey.shade300),
        ),
          hintStyle: TextStyle(
              color: AppColors.grey600,
              fontFamily: FontFamily.poppinsMedium,
              fontWeight: FontWeight.w500
          )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/font_family.dart';

import '../../../app_helpers/utils/custom_text.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({super.key});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/300",
                    ),
                  ),
                  const SizedBox(width: 12),

                   text(
                    "NAXBull",
                   fontWeight: FontWeight.w600,
                     fontFamily: FontFamily.poppinsBold,
                     fontSize: 28,
                     textColor: AppColors.darkBlue
                  ),

                  const Spacer(),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_rounded),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Portfolio Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff1D5BE2),
                      Color(0xff0848C6),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(.25),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                     text(
                      "TOTAL HOLDINGS",
                         fontWeight: FontWeight.w400,
                         fontFamily: FontFamily.poppinsRegular,
                         fontSize: 14,
                         textColor: AppColors.onPrimary
                    ),

                    const SizedBox(height: 8),

                     text(
                      "\$45,230.50",
                         fontWeight: FontWeight.w400,
                         fontFamily: FontFamily.poppinsBold,
                         fontSize: 25,
                         textColor: AppColors.onPrimary
                    ),

                    const SizedBox(height: 24),

                    Row(
                      children: [

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children:  [
                              text(
                                "Overall P/L",
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.poppinsRegular,
                            fontSize: 14,
                            textColor: Colors.white70

                              ),
                              SizedBox(height: 6),
                              text(
                                "+ \$2,410.15 (5.6%)",
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.poppinsRegular,
                                fontSize: 14,
                                textColor: Colors.greenAccent
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.white24,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.end,
                            children:  [
                              text(
                                "Wallet Balance",
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.poppinsRegular,
                                  fontSize: 14,
                                  textColor: Colors.white70
                              ),
                              SizedBox(height: 6),
                              text(
                                "\$1,102.40",
                                  fontWeight: FontWeight.w600,
                                  fontFamily: FontFamily.poppinsRegular,
                                  fontSize: 14,
                                  textColor: AppColors.onPrimary
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// Action Buttons
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  actionButton(
                    Icons.shopping_cart_outlined,
                    "Buy",
                  ),
                  actionButton(
                    Icons.account_balance,
                    "Deposit",
                  ),
                  actionButton(
                    Icons.payments_outlined,
                    "Withdraw",
                  ),
                  actionButton(
                    Icons.history,
                    "Trade History",
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// Assets Header
              Row(
                children: [
                   text(
                    "My Assets",
                       fontWeight: FontWeight.w500,
                       fontFamily: FontFamily.poppinsBold,
                       fontSize: 24,
                       textColor: AppColors.blackColor
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child:  text("View History",
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.poppinsRegular,
                        fontSize: 14,
                        textColor:AppColors.darkBlue
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10),

              assetTile(
                icon: Icons.currency_bitcoin,
                iconColor: Colors.orange,
                title: "Bitcoin",
                subtitle: "0.65 BTC",
                amount: "\$28,450.00",
                percentage: "+2.4%",
                isProfit: true,
              ),

              assetTile(
                icon: Icons.account_balance_wallet,
                iconColor: Colors.indigo,
                title: "Ethereum",
                subtitle: "4.2 ETH",
                amount: "\$10,230.12",
                percentage: "-1.1%",
                isProfit: false,
              ),

              assetTile(
                icon: Icons.token,
                iconColor: Colors.green,
                title: "Solana",
                subtitle: "45.0 SOL",
                amount: "\$4,500.22",
                percentage: "+5.8%",
                isProfit: true,
              ),

              assetTile(
                icon: Icons.circle_outlined,
                iconColor: Colors.blue,
                title: "Cardano",
                subtitle: "2,150 ADA",
                amount: "\$2,050.16",
                percentage: "+0.4%",
                isProfit: true,
              ),

              const SizedBox(height: 20),

              /// Chart Card
              Container(
                height: 220,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xffEEF3FF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Column(
                  children: [

                    const Text(
                      "PORTFOLIO GROWTH (7D)",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: [
                        chartBar(40),
                        chartBar(70),
                        chartBar(65),
                        chartBar(95),
                        chartBar(85),
                        chartBar(110),
                        chartBar(130),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Order Book
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Column(
                  children: [

                    Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Price (USDT)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Qty (BTC)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const Divider(),

                    orderRow(
                      "64,289.50",
                      "0.1250",
                      Colors.red,
                    ),

                    orderRow(
                      "64,288.10",
                      "0.4420",
                      Colors.red,
                    ),

                    orderRow(
                      "64,285.00",
                      "0.0500",
                      Colors.red,
                    ),

                    const Divider(),

                    orderRow(
                      "64,279.10",
                      "0.2310",
                      Colors.green,
                    ),

                    orderRow(
                      "64,277.50",
                      "1.2000",
                      Colors.green,
                    ),

                    orderRow(
                      "64,275.00",
                      "0.8500",
                      Colors.green,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionButton(
      IconData icon,
      String title,
      ) {
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Color(0xff0E56D8),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 70,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget chartBar(double height) {
    return Container(
      width: 22,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xff0E56D8),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget assetTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String amount,
    required String percentage,
    required bool isProfit,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        children: [

          CircleAvatar(
            radius: 25,
            backgroundColor: iconColor,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                text(
                  title,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.poppinsRegular,
              fontSize: 17,
              textColor: AppColors.blackColor

                ),
                const SizedBox(height: 4),
                text(subtitle,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.poppinsRegular,
                    fontSize: 14,
                    textColor: AppColors.blackColor
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.end,
            children: [
              text(
                amount,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamily.poppinsBold,
                  fontSize: 16,
                  textColor: AppColors.blackColor
              ),
              const SizedBox(height: 4),
              text(
                percentage,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.poppinsRegular,
                fontSize: 14,
                textColor: isProfit
                    ? Colors.green
                    : Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget orderRow(
      String price,
      String qty,
      Color color,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        children: [
          Expanded(
            child: text(
              price,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.poppinsRegular,
              fontSize: 14,
              textColor: color,
            ),
          ),
          text(
            qty,
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.poppinsRegular,
              fontSize: 14,
              textColor: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}
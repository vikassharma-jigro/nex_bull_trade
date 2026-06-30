import 'package:flutter/material.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/font_family.dart';

import '../../../app_helpers/utils/custom_text.dart';
import '../../withdraw_view/screens/withdraw_funds_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CoinModel> watchList = [
    CoinModel(
      name: "Bitcoin",
      symbol: "BTC",
      price: "\$64,120.00",
      percentage: "+1.45%",
      isPositive: true,
      icon: Icons.currency_bitcoin,
      iconColor: Colors.orange,
    ),
    CoinModel(
      name: "Ethereum",
      symbol: "ETH",
      price: "\$3,425.12",
      percentage: "+2.10%",
      isPositive: true,
      icon: Icons.token,
      iconColor: Colors.indigo,
    ),
    CoinModel(
      name: "Solana",
      symbol: "SOL",
      price: "\$142.80",
      percentage: "-0.85%",
      isPositive: false,
      icon: Icons.blur_on,
      iconColor: Colors.green,
    ),
    CoinModel(
      name: "Ripple",
      symbol: "XRP",
      price: "\$0.61",
      percentage: "+0.42%",
      isPositive: true,
      icon: Icons.all_inbox,
      iconColor: Colors.black54,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: AppColors.onPrimary,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            //SizedBox(height: 100,),
            Row(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/300",
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      text(
                          "Hello,",
                          fontWeight: FontWeight.w300,
                          fontFamily: FontFamily.poppinsRegular,
                          textColor: AppColors.textDark,
                          fontSize: 14
                      ),
                      SizedBox(height: 2),
                      text(
                          "Alex Thompson",
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamily.poppinsBold,
                          textColor: AppColors.blackColor,
                          fontSize: 20
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    size: 30,
                    color: Color(0xff2563EB),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            /// SEARCH
            TextField(
              decoration: InputDecoration(
                hintText: "Search Coins, Markets, News",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 18),
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// PORTFOLIO CARD
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff2563EB),
                      Color(0xff4F7FFF),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                      Colors.blue.withOpacity(.25),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                     text(
                      "TOTAL PORTFOLIO VALUE",
                         fontWeight: FontWeight.w600,
                         fontFamily: FontFamily.poppinsRegular,
                         textColor: AppColors.onPrimary,
                         fontSize: 12
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                         Expanded(
                          child: text(
                            "\$45,230.50",
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.poppinsRegular,
                              textColor: AppColors.onPrimary,
                              fontSize: 28
                          ),
                        ),

                        Container(
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                            BorderRadius.circular(
                                20),
                          ),
                          child:  Row(
                            children: [
                              Icon(
                                Icons.trending_up,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              text(
                                "+3.2%",
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.poppinsRegular,
                                  textColor: AppColors.onPrimary,
                                  fontSize: 13
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                     Row(
                      children: [
                        Icon(
                          Icons.refresh,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 8),
                        text(
                          "Today's Profit/Loss: +\$1,447.36",
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.poppinsRegular,
                            textColor: AppColors.onPrimary,
                            fontSize: 14
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// ACTIONS
              Row(
                children: [

                  Expanded(
                    child: buildActionCard(
                      icon: Icons.south_west,
                      title: "Deposit",
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WithdrawFundsScreen(),));
                      },
                      child: buildActionCard(
                        icon: Icons.north_east,
                        title: "Withdraw",
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xff1450CC),
                        borderRadius:
                        BorderRadius.circular(24),
                      ),
                      child:  Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sync,
                            size: 38,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          text(
                            "Buy Crypto",
                              fontWeight: FontWeight.w600,
                              fontFamily: FontFamily.poppinsRegular,
                              textColor: AppColors.onPrimary,
                              fontSize: 14
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              /// WATCHLIST TITLE
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                   text(
                    "Watchlist",
                       fontWeight: FontWeight.w600,
                       fontFamily: FontFamily.poppinsBold,
                       textColor: AppColors.blackColor,
                       fontSize: 20
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10),

              /// WATCHLIST ITEMS
              ListView.builder(
                itemCount: watchList.length,
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final coin = watchList[index];

                  return Container(
                    margin:
                    const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      children: [

                        Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: coin.iconColor
                                .withOpacity(.12),
                          ),
                          child: Icon(
                            coin.icon,
                            color: coin.iconColor,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            children: [
                              text(
                                coin.symbol,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: FontFamily.poppinsBold,
                                  textColor: AppColors.textDark,
                                  fontSize: 15
                              ),
                              const SizedBox(
                                  height: 3),
                              text(
                                coin.name,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.poppinsRegular,
                                  textColor: AppColors.textDark,
                                  fontSize: 14
                              ),
                            ],
                          ),
                        ),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            text(
                              coin.price,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamily.poppinsBold,
                                textColor: AppColors.blackColor,
                                fontSize: 18
                            ),
                            const SizedBox(height: 5),
                            Text(
                              coin.percentage,
                              style: TextStyle(
                                color: coin
                                    .isPositive
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight:
                                FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildActionCard({
    required IconData icon,
    required String title,
  }) {
    return Container(
     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xffE9EDF9),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 38,
            color: const Color(0xff1450CC),
          ),
          const SizedBox(height: 12),
          text(
            title,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.poppinsRegular,
              textColor: AppColors.textDark,
              fontSize: 14
          )
        ],
      ),
    );
  }
}

class CoinModel {
  final String name;
  final String symbol;
  final String price;
  final String percentage;
  final bool isPositive;
  final IconData icon;
  final Color iconColor;

  CoinModel({
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentage,
    required this.isPositive,
    required this.icon,
    required this.iconColor,
  });
}
import 'package:flutter/material.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/custom_text.dart';
import 'package:nax_bull_trade/app_helpers/utils/font_family.dart';
class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final List<Map<String, dynamic>> coins = [
    {
      "name": "Bitcoin",
      "symbol": "BTC",
      "price": "\$64,321.50",
      "change": "+2.45%",
      "positive": true,
      "icon": Icons.currency_bitcoin,
      "color": Colors.orange,
    },
    {
      "name": "Ethereum",
      "symbol": "ETH",
      "price": "\$3,452.12",
      "change": "-0.82%",
      "positive": false,
      "icon": Icons.blur_on,
      "color": Colors.blue,
    },
    {
      "name": "Solana",
      "symbol": "SOL",
      "price": "\$142.88",
      "change": "+12.18%",
      "positive": true,
      "icon": Icons.bolt,
      "color": Colors.purple,
    },
    {
      "name": "Cardano",
      "symbol": "ADA",
      "price": "\$0.45",
      "change": "-3.41%",
      "positive": false,
      "icon": Icons.grid_view,
      "color": Colors.indigo,
    },
    {
      "name": "Polkadot",
      "symbol": "DOT",
      "price": "\$7.24",
      "change": "+1.15%",
      "positive": true,
      "icon": Icons.bubble_chart,
      "color": Colors.pink,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage:
                    NetworkImage("https://i.pravatar.cc/300"),
                  ),
                  const SizedBox(width: 10),
                   text(
                    "NAXBull",
                   fontSize: 20,
                     fontFamily: FontFamily.poppinsBold,
                     fontWeight: FontWeight.w600,
                     textColor: AppColors.darkBlue
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none),
                  )
                ],
              ),

              const SizedBox(height: 15),

              TextField(
                decoration: InputDecoration(
                  hintText: "Search markets...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  _chip("Favorites", true),
                  _chip("USDC", false),
                  _chip("USDT", false),
                  _chip("BNB", false),
                ],
              ),

              const SizedBox(height: 15),

              Expanded(
                child: ListView.builder(
                  itemCount: coins.length,
                  itemBuilder: (context, index) {
                    final coin = coins[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                            coin["color"].withOpacity(.15),
                            child: Icon(
                              coin["icon"],
                              color: coin["color"],
                            ),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                text(
                                  coin["name"],
                                    fontSize: 15,
                                    fontFamily: FontFamily.poppinsBold,
                                    fontWeight: FontWeight.w600,
                                    textColor: AppColors.blackColor
                                ),
                                text(coin["symbol"],
                                    fontSize: 13,
                                    fontFamily: FontFamily.poppinsBold,
                                    fontWeight: FontWeight.w600,
                                    textColor: AppColors.darkBlue
                                ),
                              ],
                            ),
                          ),

                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.end,
                            children: [
                              text(
                                coin["price"],
                                  fontSize: 14,
                                  fontFamily: FontFamily.poppinsBold,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColors.blackColor
                              ),
                              text(
                                coin["change"],
                    fontSize: 12,
                    fontFamily: FontFamily.poppinsBold,
                    fontWeight: FontWeight.w600,
                    textColor:   coin["positive"]
                              ? Colors.green
                                : Colors.red,

                              ),
                            ],
                          ),

                          const SizedBox(width: 10),

                          ElevatedButton(
                            onPressed: () {},
                            child:  text("Buy",
                              fontSize: 12,
                              fontFamily: FontFamily.poppinsBold,
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.darkBlue
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                     text(
                      "Maximize your Gains",
                         fontSize: 18,
                         fontFamily: FontFamily.poppinsBold,
                         fontWeight: FontWeight.w600,
                         textColor: AppColors.onPrimary
                    ),
                    const SizedBox(height: 10),
                     text(
                      "Join NAXBull Pro for real-time order books and advanced signals.",
                         fontSize: 13,
                         fontFamily: FontFamily.poppinsRegular,
                         fontWeight: FontWeight.w600,
                         textColor: AppColors.lightWhiteColor
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {},
                      child:  text("Upgrade Now",
                          fontSize: 14,
                          fontFamily: FontFamily.poppinsBold,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.darkBlue
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _chip(String title, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Chip(
        backgroundColor:
        selected ? Colors.blue : Colors.grey.shade200,
        label: text(
          title,
          fontSize: 12,
          fontFamily: FontFamily.poppinsBold,
          fontWeight: FontWeight.w600,
          textColor: selected ? Colors.white : Colors.black,

        ),
      ),
    );
  }
}
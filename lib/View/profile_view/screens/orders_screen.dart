import 'package:flutter/material.dart';

import '../../../app_helpers/theme/app_colors.dart';
import '../../../app_helpers/utils/custom_text.dart';
import '../../../app_helpers/utils/font_family.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<OrderModel> orders = [
    OrderModel(
      coin: "Bitcoin",
      symbol: "₿",
      type: "BUY",
      status: "Completed",
      amount: "0.12 BTC",
      price: "\$64,200.00",
      total: "\$7,704.00",
      date: "Oct 24, 2023",
      time: "14:32",
      color: Colors.orange,
    ),
    OrderModel(
      coin: "Ethereum",
      symbol: "◆",
      type: "SELL",
      status: "Pending",
      amount: "2.45 ETH",
      price: "\$3,120.45",
      total: "\$7,645.10",
      date: "Oct 24, 2023",
      time: "10:15",
      color: Colors.deepPurple,
    ),
    OrderModel(
      coin: "Solana",
      symbol: "⬢",
      type: "BUY",
      status: "Cancelled",
      amount: "50 SOL",
      price: "\$142.12",
      total: "\$7,106.00",
      date: "Oct 23, 2023",
      time: "18:45",
      color: Colors.green,
    ),
    OrderModel(
      coin: "Bitcoin",
      symbol: "₿",
      type: "SELL",
      status: "Completed",
      amount: "0.05 BTC",
      price: "\$63,890.00",
      total: "\$3,194.50",
      date: "Oct 22, 2023",
      time: "09:12",
      color: Colors.orange,
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title:  text(
          "Your Orders",
          textColor: AppColors.blackColor,
          fontFamily: FontFamily.poppinsBold,
          fontSize: 20,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.black),
          )
        ],
      ),
      body: Column(
        children: [

          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [

                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search orders...",
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.tune),
                )

              ],
            ),
          ),

          const SizedBox(height: 15),

          TabBar(
            controller: _tabController,
            isScrollable: true,

            indicatorColor: AppColors.darkBlue,
            labelColor: AppColors.darkBlue,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: "All"),
              Tab(text: "Buy"),
              Tab(text: "Sell"),
              Tab(text: "Pending"),
              Tab(text: "Completed"),
            ],
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length + 1,
              itemBuilder: (context, index) {

                if (index == orders.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text("View Older History"),
                      ),
                    ),
                  );
                }

                return OrderCard(order: orders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderModel {
  final String coin;
  final String symbol;
  final String type;
  final String status;
  final String amount;
  final String price;
  final String total;
  final String date;
  final String time;
  final Color color;

  OrderModel({
    required this.coin,
    required this.symbol,
    required this.type,
    required this.status,
    required this.amount,
    required this.price,
    required this.total,
    required this.date,
    required this.time,
    required this.color,
  });
}


class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [

          /// Top Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: order.color.withOpacity(.12),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: text(
                    order.symbol,
                    textColor: order.color,
                    fontFamily: FontFamily.poppinsBold,
                    fontSize: 22,

                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [

                        text(
                          order.coin,
                          textColor: AppColors.blackColor,
                          fontFamily: FontFamily.poppinsBold,
                          fontSize: 14,
                        ),

                        const SizedBox(width: 8),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: order.type == "BUY"
                                ? Colors.green.shade100
                                : Colors.red.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: text(
                            order.type,
                            textColor: order.type == "BUY"
                                ? Colors.green
                                : Colors.red,
                            fontFamily: FontFamily.poppinsBold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    text(
                      "${order.date} • ${order.time}",
                      textColor: AppColors.grey600,
                      fontFamily: FontFamily.poppinsBold,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _statusColor(order.status).withOpacity(.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: text(
                  order.status,
                  textColor: _statusColor(order.status),
                  fontFamily: FontFamily.poppinsMedium,
                  fontSize: 12,
                ),
              )
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [

              _info(
                "AMOUNT",
                order.amount,
                Alignment.centerLeft,
              ),

              _info(
                "PRICE",
                order.price,
                Alignment.center,
              ),

              _info(
                "TOTAL",
                order.total,
                Alignment.centerRight,
                isBlue: true,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _info(
      String title,
      String value,
      Alignment alignment, {
        bool isBlue = false,
      }) {
    return Expanded(
      child: Align(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: alignment == Alignment.centerLeft
              ? CrossAxisAlignment.start
              : alignment == Alignment.center
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.end,
          children: [

            text(
              title,
              textColor: AppColors.grey600,
              fontFamily: FontFamily.poppinsMedium,
              fontSize: 12,
              latterSpacing: .5

            ),

            const SizedBox(height: 5),

            text(
              value,
              textColor: isBlue ? AppColors.darkBlue :AppColors.blackColor,
              fontFamily: FontFamily.poppinsMedium,
              fontSize: 15,

            ),
          ],
        ),
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;

      case "Pending":
        return Colors.orange;

      case "Cancelled":
        return Colors.red;

      default:
        return Colors.blue;
    }
  }
}
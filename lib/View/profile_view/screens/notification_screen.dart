import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool pushPreview = true;

  bool emailAlerts = true;
  bool loginAlerts = true;

  bool priceAlerts = true;
  bool buySellAlerts = true;

  bool portfolioUpdates = false;
  bool withdrawalUpdates = false;

  bool marketNews = true;
  bool promotionNotifications = false;

  TimeOfDay startTime = const TimeOfDay(hour: 22, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 7, minute: 0);

  Future<void> pickTime(bool start) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: start ? startTime : endTime,
    );

    if (picked != null) {
      setState(() {
        if (start) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Notification Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.settings_outlined, color: Colors.black),
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart), label: "Markets"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: "Trade"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: "Portfolio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            sectionTitle(
              "Notification Preview",
              Icons.notifications_none,
            ),

            buildSwitchTile(
              title: "Show Previews",
              subtitle: "Hide Sensitive Information",
              value: pushPreview,
              onChanged: (v) => setState(() => pushPreview = v),
            ),

            const SizedBox(height: 16),

            sectionTitle(
              "Security & System",
              Icons.security,
              premium: true,
            ),

            buildSwitchTile(
              title: "Login Alerts",
              subtitle: "Receive login notifications",
              value: loginAlerts,
              onChanged: (v) => setState(() => loginAlerts = v),
            ),

            buildSwitchTile(
              title: "Email Notifications",
              subtitle: "Receive security alerts via email",
              value: emailAlerts,
              onChanged: (v) => setState(() => emailAlerts = v),
            ),

            const SizedBox(height: 16),

            sectionTitle(
              "Trading Alerts",
              Icons.candlestick_chart,
            ),

            buildSwitchTile(
              title: "Price Alerts",
              subtitle: "Notify when target price hits",
              value: priceAlerts,
              onChanged: (v) => setState(() => priceAlerts = v),
            ),

            buildSwitchTile(
              title: "Buy & Sell Confirmations",
              subtitle: "Trade execution updates",
              value: buySellAlerts,
              onChanged: (v) => setState(() => buySellAlerts = v),
            ),

            const SizedBox(height: 16),

            sectionTitle(
              "Account Activity",
              Icons.account_balance_wallet_outlined,
            ),

            buildSwitchTile(
              title: "Portfolio Updates",
              subtitle: "Daily portfolio summary",
              value: portfolioUpdates,
              onChanged: (v) => setState(() => portfolioUpdates = v),
            ),

            buildSwitchTile(
              title: "Deposits & Withdrawals",
              subtitle: "Transaction notifications",
              value: withdrawalUpdates,
              onChanged: (v) => setState(() => withdrawalUpdates = v),
            ),

            const SizedBox(height: 16),

            sectionTitle(
              "Do Not Disturb",
              Icons.do_not_disturb_alt,
            ),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    Row(
                      children: [

                        Expanded(
                          child: GestureDetector(
                            onTap: ()=>pickTime(true),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(startTime.format(context)),
                              ),
                            ),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("-"),
                        ),

                        Expanded(
                          child: GestureDetector(
                            onTap: ()=>pickTime(false),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(endTime.format(context)),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            sectionTitle(
              "Market & Promotions",
              Icons.campaign_outlined,
            ),

            buildSwitchTile(
              title: "Market News",
              subtitle: "Latest crypto news",
              value: marketNews,
              onChanged: (v) => setState(() => marketNews = v),
            ),

            buildSwitchTile(
              title: "Promotion Notifications",
              subtitle: "Offers & Rewards",
              value: promotionNotifications,
              onChanged: (v) =>
                  setState(() => promotionNotifications = v),
            ),

            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title, IconData icon,{bool premium=false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [

          Icon(icon,size:20,color: Colors.blue),

          const SizedBox(width:8),

          Text(
            title,
            style: const TextStyle(
              fontSize:16,
              fontWeight: FontWeight.w700,
            ),
          ),

          if(premium)...[
            const SizedBox(width:8),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal:8,
                  vertical:2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "PREMIUM",
                style: TextStyle(
                    color: Colors.white,
                    fontSize:10),
              ),
            )
          ]
        ],
      ),
    );
  }

  Widget buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(subtitle),

        trailing: CupertinoSwitch(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
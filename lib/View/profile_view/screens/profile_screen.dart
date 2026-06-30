import 'package:flutter/material.dart';
import 'package:nax_bull_trade/View/profile_view/screens/edit_profile_screen.dart';
import 'package:nax_bull_trade/View/profile_view/screens/notification_screen.dart';
import 'package:nax_bull_trade/View/profile_view/screens/orders_screen.dart';
import 'package:nax_bull_trade/View/profile_view/screens/security_screen.dart';

import '../../../app_helpers/theme/app_colors.dart';
import '../../../app_helpers/utils/custom_text.dart';
import '../../../app_helpers/utils/font_family.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onPrimary,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title:  text(
          "NAXBull",
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.poppinsBold,
          fontSize: 28,
          textColor: AppColors.darkBlue,

        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xff0D5BE1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xff0D5BE1),
              child: ClipOval(
                child: Image.network(
                  "https://i.pravatar.cc/300",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 25),

            /// Profile Image
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/300",
                    ),
                  ),
                ),

                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.darkBlue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            ),

            const SizedBox(height: 18),

             text(
              "Alex Thompson",
               fontWeight: FontWeight.w700,
               fontFamily: FontFamily.poppinsBold,
               fontSize: 28,
               textColor: AppColors.blackColor,
            ),

            const SizedBox(height: 6),

             text(
              "alex.thompson@naxbull.io",
               fontWeight: FontWeight.w400,
               fontFamily: FontFamily.poppinsRegular,
               fontSize: 16,
               textColor: AppColors.textDark,
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                badge(
                  title: "Verified",
                  color: const Color(0xff62E67E),
                  icon: Icons.verified,
                ),
                const SizedBox(width: 10),
                badge(
                  title: "Pro Trader",
                  color: const Color(0xff2D67EA),
                ),
              ],
            ),

            const SizedBox(height: 35),

            sectionTitle("SECURITY & ACCOUNT"),

            const SizedBox(height: 12),

            settingsCard(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(),));
                  },
                  child: settingsTile(
                    Icons.person_outline,
                    "Personal Information",
                    "Name, Email, Phone",
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersScreen(),));
                  },
                  child: settingsTile(
                    Icons.inventory_2_outlined,
                    "Your Orders",
                    "See your all order list",
                  ),
                ),
                settingsTile(
                  Icons.account_balance_wallet_outlined,
                  "Wallet Management",
                  "Connected accounts, API keys",
                ),
                settingsTile(
                  Icons.account_balance_outlined,
                  "Linked Bank Account",
                  "add your bank accounts",
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecurityScreen(),));
                  },
                  child: settingsTile(
                    Icons.shield_outlined,
                    "Security",
                    "2FA, Password, Biometrics",
                    isLast: true,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            sectionTitle("APP SETTINGS"),

            const SizedBox(height: 12),

            settingsCard(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettingsScreen(),));
                  },
                  child: settingsTile(
                    Icons.notifications_none,
                    "Notification",
                    "Notifications Setting",
                  ),
                ),
                settingsTile(
                  Icons.help_outline,
                  "Help Center",
                  "FAQs, Contact us, Live chat",
                ),
                settingsTile(
                  Icons.privacy_tip_outlined,
                  "Term & Condition",
                  "Privacy policy, Terms of service",
                  isLast: true,
                ),
              ],
            ),

            const SizedBox(height: 40),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                label:  text(
                  "Logout",
                 fontSize: 20,
                  fontFamily: FontFamily.poppinsBold,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.red
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.red,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Version 2.4.1 (Build 890)",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget badge({
    required String title,
    required Color color,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: Colors.black87,
              size: 16,
            ),
          if (icon != null)
            const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            letterSpacing: 2,
            color: Color(0xff7A7F94),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget settingsCard({
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
          )
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget settingsTile(
      IconData icon,
      String title,
      String subtitle, {
        bool isLast = false,
      }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 6,
          ),
          leading: Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: const Color(0xffEEF4FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xff0D5BE1),
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(subtitle),
          trailing: const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ),
        if (!isLast)
          const Divider(
            height: 1,
          ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/custom_text.dart';
import 'package:nax_bull_trade/app_helpers/utils/font_family.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 300,
        backgroundColor: AppColors.onPrimary,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.blackColor,
                      ),
                    ),
                    const Spacer(),
                    text(
                      "Profile",
                      textColor: AppColors.blackColor,
                      fontFamily: FontFamily.poppinsBold,
                      fontSize: 22,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.settings,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      backgroundImage:
                      NetworkImage("https://i.pravatar.cc/300"),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                 text(
                  "Vikash Sharma",
                   textColor: AppColors.blackColor,
                   fontFamily: FontFamily.poppinsBold,
                   fontSize: 22,
                ),

                const SizedBox(height: 5),

                const Text(
                  "vikash@gmail.com",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Text(
                    "Verified Account",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 20),

            /// Personal Details Card
            _card(
              child: Column(
                children: [

                  _tile(Icons.person, "Full Name", "Vikash Sharma"),

                  Divider(),

                  _tile(Icons.phone, "Phone", "+91 9876543210"),

                  Divider(),

                  _tile(Icons.email, "Email", "vikash@gmail.com"),

                  Divider(),

                  _tile(Icons.location_on, "Address",
                      "Jaipur, Rajasthan"),
                ],
              ),
            ),

            /// Verification Card
            _card(
              child: Column(
                children: [

                  Row(
                    children: const [

                      Icon(Icons.verified,
                          color: Colors.green),

                      SizedBox(width: 10),

                      Text(
                        "KYC Verification",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Spacer(),

                      Chip(
                        label: Text("Verified"),
                        backgroundColor:
                        Color(0xffE6F8EC),
                      ),
                    ],
                  ),

                  SizedBox(height: 18),

                  _tile(Icons.credit_card,
                      "PAN Number", "ABCDE1234F"),

                  Divider(),

                  _tile(Icons.badge,
                      "Aadhaar", "XXXX XXXX 4587"),
                ],
              ),
            ),

            /// Bank Card
            _card(
              child: Column(
                children: [

                  Row(
                    children: const [

                      Icon(Icons.account_balance,
                          color: Colors.blue),

                      SizedBox(width: 10),

                      Text(
                        "Bank Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  _tile(Icons.account_balance_wallet,
                      "Bank", "HDFC Bank"),

                  Divider(),

                  _tile(Icons.numbers,
                      "Account", "XXXXXXX2548"),

                  Divider(),

                  _tile(Icons.code,
                      "IFSC", "HDFC0001245"),
                ],
              ),
            ),

            /// Buttons

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xff2B59E8),
                    padding:
                    const EdgeInsets.symmetric(
                        vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding:
                    const EdgeInsets.symmetric(
                        vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Change Password",
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
          )
        ],
      ),
      child: child,
    );
  }

  Widget _tile(
      IconData icon,
      String title,
      String value,
      ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor:
        Colors.blue.withOpacity(.1),
        child: Icon(
          icon,
          color: Colors.blue,
        ),
      ),
      title: Text(title),
      subtitle: Text(value),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
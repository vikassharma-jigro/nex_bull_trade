import 'package:flutter/material.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/custom_text.dart';
import 'package:nax_bull_trade/app_helpers/utils/font_family.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool faceId = true;
  bool biometric = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title:  text(
          "Security",
          fontWeight: FontWeight.w600,
          textColor: AppColors.blackColor,
          fontSize: 20,fontFamily: FontFamily.poppinsBold,

        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children:  [
                Icon(Icons.verified_user,
                    color: Colors.green, size: 16),
                SizedBox(width: 5),
                text(
                  "SECURE",
                  fontWeight: FontWeight.w600,
                  textColor: Colors.green,
                  fontSize: 11,fontFamily: FontFamily.poppinsBold,

                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// Shield Icon
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shield_outlined,
                size: 40,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 18),

             text(
              "Protect your assets",
               fontWeight: FontWeight.w600,
               textColor: AppColors.blackColor,
               fontSize: 20,fontFamily: FontFamily.poppinsBold,
            ),

            const SizedBox(height: 8),

            text(
              "Manage your authentication methods and\nsecurity protocols for NAXBUL.",
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              textColor: AppColors.grey600,
              fontSize: 14,fontFamily: FontFamily.poppinsRegular,
            ),

            const SizedBox(height: 25),

            /// Security Status Card
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                border: Border.all(color: Colors.green.shade200),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline,
                      color: Colors.green),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                         text(
                          "SECURITY STATUS: HIGH",
                           fontWeight: FontWeight.w600,
                           textColor: Colors.green,
                           fontSize: 14,fontFamily: FontFamily.poppinsBold,
                        ),
                        const SizedBox(height: 5),
                        text(
                          "Your account is currently protected by 3 active security layers. Your funds are secure.",
                          fontWeight: FontWeight.w400,
                          textColor:AppColors.grey700,
                          fontSize: 13,fontFamily: FontFamily.poppinsRegular,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            sectionTitle("BIOMETRICS"),

            settingTile(
              icon: Icons.face,
              title: "Face ID",
              subtitle: "Enabled",
              trailing: Switch(
                value: faceId,
                onChanged: (v) {
                  setState(() {
                    faceId = v;
                  });
                },
              ),
            ),

            const SizedBox(height: 12),

            settingTile(
              icon: Icons.fingerprint,
              title: "Biometric Login",
              subtitle: "Use for transactions",
              trailing: Switch(
                value: biometric,
                onChanged: (v) {
                  setState(() {
                    biometric = v;
                  });
                },
              ),
            ),

            const SizedBox(height: 25),

            sectionTitle("AUTHENTICATION"),

            settingTile(
              icon: Icons.pin,
              title: "Change PIN",
              subtitle: "Last changed 3 months ago",
              trailing: const Icon(Icons.chevron_right),
            ),

            const SizedBox(height: 25),

            sectionTitle("ACTIVITY"),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.08),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.devices),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "Current Device",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "This Device",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "iPhone 15 Pro • London, UK",
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Last active: Just now",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// Bottom Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.network(
                    "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=800",
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(.7),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Advanced Protection",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Learn more about our cold storage vaults",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: text(
          title,
          fontWeight: FontWeight.w600,
          textColor: AppColors.darkBlue,
          fontSize: 12,fontFamily: FontFamily.poppinsBold,
        ),
      ),
    );
  }

  Widget settingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 15, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            child: Icon(icon, color: Colors.grey.shade700),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          trailing
        ],
      ),
    );
  }
}
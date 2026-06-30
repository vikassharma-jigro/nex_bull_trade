import 'package:flutter/material.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/custom_text.dart';
import 'package:nax_bull_trade/app_helpers/utils/font_family.dart';

class BuyBtcScreen extends StatelessWidget {
  const BuyBtcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// HEADER
              Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/300",
                    ),
                  ),
                  const SizedBox(width: 10),
                   text(
                    "NAXBull",
                    textColor: AppColors.darkBlue,
                     fontSize: 20,fontFamily: FontFamily.poppinsBold,
                     fontWeight: FontWeight.w600
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: AppColors.darkBlue
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// BTC CARD
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child:  Center(
                            child: text(
                              "B",
                                textColor: AppColors.onPrimary,
                                fontSize: 15,fontFamily: FontFamily.poppinsBold,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Positioned(
                          right: -10,
                          child: Container(
                            width: 34,
                            height: 34,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child:  Center(
                              child: text(
                                "U",
                                  textColor: AppColors.onPrimary,
                                  fontSize: 15,fontFamily: FontFamily.poppinsBold,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(width: 28),

                     Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          text(
                            "BTC /\nUSDT",
                              textColor: AppColors.blackColor,
                              fontSize: 17,fontFamily: FontFamily.poppinsBold,
                              fontWeight: FontWeight.w600
                          ),
                          SizedBox(height: 4),
                          text(
                            "Bitcoin",
                            textColor: AppColors.textDark,
                            fontSize: 12,fontFamily: FontFamily.poppinsRegular,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children:  [
                        text(
                          "64,281.40",
                        textColor: Color(0xff007A3D),
                        fontSize: 18,fontFamily: FontFamily.poppinsBold,
                        fontWeight: FontWeight.w600

                        ),
                        SizedBox(height: 4),
                        text(
                          "+2.45% (24h)",
                            textColor: Color(0xff007A3D),
                            fontSize: 12,fontFamily: FontFamily.poppinsRegular,
                            fontWeight: FontWeight.w400
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 18),

              /// CHART CARD
              Container(
                height: 390,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _tab("15m", true),
                        _tab("1h", false),
                        _tab("4h", false),
                        _tab("1d", false),
                        const SizedBox(width: 12),
                        Container(
                          width: 1,
                          height: 16,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(width: 12),
                         text(
                          "Depth",
                             textColor: AppColors.blackColor,
                             fontSize: 13,fontFamily: FontFamily.poppinsBold,
                             fontWeight: FontWeight.w600
                        ),
                        const Spacer(),
                        const Icon(Icons.fullscreen),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: CustomPaint(
                        painter: CandleChartPainter(),
                        child: Container(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              /// BUY CARD
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children:  [
                        text(
                          "Wallet Balance",
                            textColor: AppColors.blackColor,
                            fontSize: 12,fontFamily: FontFamily.poppinsRegular,
                            fontWeight: FontWeight.w500
                        ),
                        text(
                          "1,240.50 USDT",
                            textColor: AppColors.blackColor,
                            fontSize: 15,fontFamily: FontFamily.poppinsRegular,
                            fontWeight: FontWeight.w500
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    _field("64,281.40", "USDT"),

                    const SizedBox(height: 14),

                    _field("Quantity", "BTC"),

                    const SizedBox(height: 18),

                     Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        text("Est. Total",
                            textColor: AppColors.blackColor,
                            fontSize: 15,fontFamily: FontFamily.poppinsRegular,
                            fontWeight: FontWeight.w500
                        ),
                        text("0.00 USDT",
                            textColor: AppColors.blackColor,
                            fontSize: 14,fontFamily: FontFamily.poppinsRegular,
                            fontWeight: FontWeight.w500
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                     Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        text("Fee (0.1%)",
                            textColor: AppColors.blackColor,
                            fontSize: 15,fontFamily: FontFamily.poppinsRegular,
                            fontWeight: FontWeight.w500
                        ),
                        text("0.00 USDT",
                            textColor: AppColors.blackColor,
                            fontSize: 14,fontFamily: FontFamily.poppinsRegular,
                            fontWeight: FontWeight.w500
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    CommonButton(
                      text: "Buy BTC",
                      color: AppColors.darkBlue,
                      onPressed: (){
                        //Navigator.push(context,MaterialPageRoute(builder: (context) => OtpScreen(),));
                      },
                      fontFamily: FontFamily.poppinsBold,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.onPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tab(String text1, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: text(
        text1,
          textColor: selected
              ? const Color(0xff2F63FF)
              : Colors.black87,
          fontSize: 14,fontFamily: FontFamily.poppinsRegular,
          fontWeight: FontWeight.w600

      ),
    );
  }

  Widget _field(String hint, String suffix) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        suffixText: suffix,
        filled: true,
        fillColor: const Color(0xffEEF2FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class CandleChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(.15)
      ..strokeWidth = 1;

    for (int i = 0; i < 8; i++) {
      double dx = size.width * i / 7;
      canvas.drawLine(
        Offset(dx, 0),
        Offset(dx, size.height),
        gridPaint,
      );
    }

    for (int i = 0; i < 6; i++) {
      double dy = size.height * i / 5;
      canvas.drawLine(
        Offset(0, dy),
        Offset(size.width, dy),
        gridPaint,
      );
    }

    final candles = [
      [90.0, 60.0, false],
      [75.0, 55.0, false],
      [130.0, 90.0, true],
      [170.0, 100.0, true],
      [110.0, 80.0, false],
      [220.0, 80.0, true],
    ];

    double startX = 20;

    for (int i = 0; i < candles.length; i++) {
      bool green = candles[i][2] as bool;

      final bodyPaint = Paint()
        ..color = green
            ? Colors.green.withOpacity(.25)
            : Colors.red.withOpacity(.25);

      final wickPaint = Paint()
        ..color =
        green ? Colors.green.shade700 : Colors.red;
      wickPaint.strokeWidth = 4;
      wickPaint.strokeCap = StrokeCap.round;

      double bodyHeight = candles[i][0] as double;
      double bodyTop =
          size.height - bodyHeight - (candles[i][1] as double);

      Rect rect = Rect.fromLTWH(
        startX,
        bodyTop,
        38,
        bodyHeight,
      );

      canvas.drawRect(rect, bodyPaint);

      canvas.drawLine(
        Offset(startX + 19, bodyTop - 35),
        Offset(startX + 19, bodyTop),
        wickPaint,
      );

      startX += 48;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
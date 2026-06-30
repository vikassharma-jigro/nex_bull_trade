import 'package:flutter/material.dart';
import 'package:nax_bull_trade/View/auth_view/auth_screens/login_screen.dart';
import 'package:nax_bull_trade/app_helpers/theme/app_colors.dart';
import 'package:nax_bull_trade/app_helpers/utils/app_images.dart';

class Onboarding2Screen extends StatefulWidget {
  const Onboarding2Screen({super.key});

  @override
  State<Onboarding2Screen> createState() => _Onboarding2ScreenState();
}

class _Onboarding2ScreenState extends State<Onboarding2Screen> {
  final PageController _controller = PageController();

  int currentIndex = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: AppImages.illustrationIcon,
      title: "Trade Crypto Smarter",
      description:
      "Buy, sell and manage digital assets with professional tools designed for clarity and speed.",
    ),
    OnboardingModel(
      image: AppImages.simplifiedIcon,
      title: "Real-Time Markets",
      description:
      "Track markets and trade instantly with millisecond execution.",
    ),
    OnboardingModel(
      image: AppImages.visualIcon,
      title: "Secure Asset Protection",
      description:
      "Your funds protected with advanced security, institutional-grade vaults, and real-time monitoring.",
    ),
  ];

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to Home/Login Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),

                      /// Logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.show_chart,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "NAXBull",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      /// Image Card
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          pages[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),

                      //const SizedBox(height: 10),

                      Text(
                        pages[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1E2235),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          pages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.5,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            /// Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: currentIndex == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.blue
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            /// Next Button
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2962FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  currentIndex == pages.length - 1
                      ? "Get Started"
                      : "Next",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            //const SizedBox(height: 15),

            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginScreen(),));
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

           // const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}
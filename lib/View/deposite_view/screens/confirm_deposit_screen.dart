import 'package:flutter/material.dart';

class ConfirmDepositScreen extends StatelessWidget {
  const ConfirmDepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Deposit Funds",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2962FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => const DepositSuccessScreen(),
                //   ),
                // );
              },
              child: const Text(
                "Confirm Payment",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            const SizedBox(height: 10),

            Container(
              height: 85,
              width: 85,
              decoration: const BoxDecoration(
                color: Color(0xff2962FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.white,
                size: 42,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "REVIEW DETAILS",
              style: TextStyle(
                color: Color(0xff2962FF),
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Confirm Deposit",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                children: [

                  const Text(
                    "Amount to Deposit",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "₹5,000.00",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Divider(color: Colors.grey.shade300),

                  const SizedBox(height: 20),

                  _row(
                    "Payment Method",
                    "UPI - alex@upi",
                    Icons.account_balance_wallet,
                  ),

                  const SizedBox(height: 18),

                  _row(
                    "Processing Time",
                    "Instant",
                    Icons.flash_on,
                    valueColor: Colors.green,
                  ),

                  const SizedBox(height: 18),

                  _row(
                    "Wallet to be Credited",
                    "Spot Wallet",
                    Icons.account_balance,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.blue.shade100,
                ),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Icon(
                    Icons.security,
                    color: Colors.blue,
                  ),

                  SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Security & Trust",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          "Your transaction is protected with bank-grade encryption. Funds are transferred securely and credited instantly after successful payment.",
                          style: TextStyle(
                            color: Colors.black54,
                            height: 1.4,
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "By clicking 'Confirm Payment', you agree to our Terms of Service and Deposit Policies.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }

  Widget _row(
      String title,
      String value,
      IconData icon, {
        Color valueColor = Colors.black,
      }) {
    return Row(
      children: [

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ),

        Icon(
          icon,
          size: 18,
          color: Colors.black54,
        ),

        const SizedBox(width: 6),

        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: valueColor,
            fontSize: 15,
          ),
        ),

      ],
    );
  }
}
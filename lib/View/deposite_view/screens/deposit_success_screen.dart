import 'package:flutter/material.dart';

class DepositSuccessScreen extends StatelessWidget {
  const DepositSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Deposit Funds",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// Success Icon
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.shade100,
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 80,
                  color: Colors.green.shade700,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Amount Successfully\nAdded to Wallet",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Your transaction has been processed securely.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 30),

              /// Amount Paid
              _infoCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "AMOUNT PAID",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "₹5,000.00",
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              /// Details Card
              _infoCard(
                child: Column(
                  children: [
                    _detailRow(
                      "Updated Balance",
                      "₹17,450.80",
                    ),
                    const Divider(height: 30),
                    _detailRow(
                      "Transaction ID",
                      "NB8829410CX",
                    ),
                    const Divider(height: 30),
                    _detailRow(
                      "Date & Time",
                      "24 Oct 2023 • 02:45 PM",
                    ),
                  ],
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Receipt Download
                  },
                  icon: const Icon(Icons.receipt_long),
                  label: const Text(
                    "View Receipt",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2962FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _infoCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  static Widget _detailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
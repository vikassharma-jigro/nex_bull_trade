import 'package:flutter/material.dart';

class DepositFundsScreen extends StatelessWidget {
  const DepositFundsScreen({super.key});

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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.help_outline, color: Colors.black87),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff0D5EF4),
                    Color(0xff4D8CFF),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.25),
                    blurRadius: 12,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Available Balance",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "\$12,450.80",
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "+2.4% Today",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )

                ],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  "Deposit Methods",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Instant Support",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                )

              ],
            ),

            const SizedBox(height: 18),

            _methodTile(
              context,
              icon: Icons.account_balance_wallet_outlined,
              title: "UPI",
              subtitle: "Instant & Free",
              badge: "POPULAR",
              color: Colors.blue,
              onTap: () {
                // Navigator.push(...)
              },
            ),

            _methodTile(
              context,
              icon: Icons.account_balance,
              title: "Bank Transfer",
              subtitle: "IMPS / NEFT • 30 mins",
              color: Colors.grey,
            ),

            _methodTile(
              context,
              icon: Icons.credit_card,
              title: "Debit Card",
              subtitle: "Instant • Visa, Master, Rupay",
              color: Colors.deepPurple,
            ),

            _methodTile(
              context,
              icon: Icons.payment,
              title: "Credit Card",
              subtitle: "Instant • 2% Surcharge",
              color: Colors.orange,
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Icon(
                    Icons.security,
                    color: Colors.blue,
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: const [

                        Text(
                          "Security Guaranteed",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          "All transactions are secured with 256-bit encryption. "
                              "We never store your card details.",
                          style: TextStyle(
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        )

                      ],
                    ),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _methodTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        String? badge,
        required Color color,
        VoidCallback? onTap,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
          ),
          child: Row(
            children: [

              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: color.withOpacity(.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: color,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [

                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        if (badge != null)
                          Container(
                            margin:
                            const EdgeInsets.only(left: 8),
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                              BorderRadius.circular(20),
                            ),
                            child: Text(
                              badge,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          )

                      ],
                    ),

                    const SizedBox(height: 6),

                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    )

                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              )

            ],
          ),
        ),
      ),
    );
  }
}
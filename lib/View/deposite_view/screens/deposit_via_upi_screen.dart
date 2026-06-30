import 'package:flutter/material.dart';

class DepositViaUpiScreen extends StatefulWidget {
  const DepositViaUpiScreen({super.key});

  @override
  State<DepositViaUpiScreen> createState() => _DepositViaUpiScreenState();
}

class _DepositViaUpiScreenState extends State<DepositViaUpiScreen> {
  final TextEditingController amountController =
  TextEditingController(text: "5000");

  final TextEditingController upiController = TextEditingController();

  int? selectedChip = 2;
  int? selectedUpi = 0;

  final List<int> amounts = [500, 1000, 5000, 10000, 25000];

  final List<Map<String, String>> recentUpi = [
    {
      "name": "rohan.sharma@okaxis",
      "time": "Used 2 hours ago",
    },
    {
      "name": "priya99@paytm",
      "time": "Last used yesterday",
    },
  ];

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
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
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
                // Navigator.push(...)
              },
              child: const Text(
                "Proceed to Pay",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "DEPOSIT AMOUNT",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixText: "₹ ",
                ),
              ),
            ),

            const SizedBox(height: 18),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(amounts.length, (index) {
                bool selected = selectedChip == index;

                return ChoiceChip(
                  label: Text("₹${amounts[index]}"),
                  selected: selected,
                  selectedColor: const Color(0xff2962FF),
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : Colors.black,
                  ),
                  onSelected: (_) {
                    setState(() {
                      selectedChip = index;
                      amountController.text = amounts[index].toString();
                    });
                  },
                );
              }),
            ),

            const SizedBox(height: 28),

            const Text(
              "RECENTLY USED",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            ...List.generate(recentUpi.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    setState(() {
                      selectedUpi = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.green.shade100,
                          child: const Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                recentUpi[index]["name"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                recentUpi[index]["time"]!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Radio<int>(
                          value: index,
                          groupValue: selectedUpi,
                          onChanged: (v) {
                            setState(() {
                              selectedUpi = v;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 10),

            const Text(
              "NEW UPI ID",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: upiController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        hintText: "username@bank",
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Verify"),
                  )
                ],
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "UPI ID should look like user@upi or mobile@bank",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 22),

            Container(
              padding: const EdgeInsets.all(16),
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
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Secure Transactions",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Your funds are protected with bank-grade encryption and 2FA verification.",
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

            const SizedBox(height: 30),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "FINAL AMOUNT  ₹${amountController.text}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
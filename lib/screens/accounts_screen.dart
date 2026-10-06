import 'package:breadcrumbs/components/account_card.dart';
import 'package:breadcrumbs/components/bottom_navbar.dart';
import 'package:breadcrumbs/components/total_balance_card.dart';
import 'package:breadcrumbs/data/account_data.dart';
import 'package:breadcrumbs/style.dart';
import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  final List<Map<String, dynamic>> _accounts = const [
    {
      'id': 'acc_1',
      'name': 'Cash',
      'balance': 5600.75,
      'income': 0.0,
      'expense': 56.0,
      'type': AccType.cash,
      'currency': '₹',
      'color': 0xFF10B981,
    },
    {
      'id': 'acc_2',
      'name': 'Primary Bank',
      'balance': 5558.0,
      'income': 0.0,
      'expense': 98.0,
      'type': AccType.bank,
      'currency': '₹',
      'color': 0xFF3B82F6,
    },
  ];

  double get _totalBalance {
    double total = 0;
    for (var acc in _accounts) {
      total += (acc['balance'] as num).toDouble();
    }
    return total;
  }

  double get _totalIncome {
    double total = 0;
    for (var acc in _accounts) {
      total += (acc['income'] as num).toDouble();
    }
    return total;
  }

  double get _totalExpense {
    double total = 0;
    for (var acc in _accounts) {
      total += (acc['expense'] as num).toDouble();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Asset Management",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/addAccount');
            },
            icon: const Icon(Icons.add_circle_outline, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TotalBalanceCard(
              totalBalance: _totalBalance,
              totalIncome: _totalIncome,
              totalExpense: _totalExpense,
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Asset Accounts",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "${_accounts.length}",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "₹${_totalBalance.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Color(0xFFF59E0B),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _accounts.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return AccountCard(account: _accounts[index]);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(currentScreen: 3),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum AccType {
  cash,
  bank,
  creditCard,
  debitCard,
  investment,
  digitalWallet,
  savingsGoal,
}

class AccountData {
  static const String keyAccounts = "ACCOUNTS";
  final Box _myDb = Hive.box('breadCrumbsDB');

  List accounts = [];

  void createInitialAccounts() {
    accounts = [
      {
        'id': 'acc_1',
        'name': 'Cash',
        'balance': 0,
        'type': AccType.cash,
        'icon': getAccountIcon(AccType.cash),
        'color': 0xFF4CAF50,
      },
      {
        'id': 'acc_2',
        'name': 'Primary Bank',
        'balance': 0,
        'type': AccType.bank,
        'icon': getAccountIcon(AccType.bank),
        'color': 0xFF2196F3,
      },
    ];
    saveAccounts();
  }

  void loadAccounts() {
    accounts = _myDb.get(keyAccounts);
    if (accounts.isEmpty) {
      createInitialAccounts();
    }
  }

  void saveAccounts() {
    _myDb.put(keyAccounts, accounts);
  }

  void addAccount(Map<String, dynamic> account) {
    accounts.add(account);
    saveAccounts();
  }

  void deleteAccount(String id) {
    accounts.removeWhere((acc) => acc['id'] == id);
    saveAccounts();
  }

  void updateBalance(String? accountId, double amount, String type) {
    if (accountId == null) return;
    final index = accounts.indexWhere((acc) => acc['id'] == accountId);
    if (index != -1) {
      final currentBal = accounts[index]['balance'] as double;
      if (type == 'income') {
        accounts[index]['balance'] = currentBal + amount;
      } else if (type == 'expense') {
        accounts[index]['balance'] = currentBal - amount;
      }
      saveAccounts();
    }
  }
  
  static IconData getAccountIcon(AccType type) {
    switch (type) {
      case AccType.cash:
        return Icons.payments_outlined;
      case AccType.bank:
        return Icons.account_balance_outlined;
      case AccType.creditCard:
      case AccType.debitCard:
        return Icons.credit_card_outlined;
      case AccType.investment:
        return Icons.trending_up_outlined;
      case AccType.digitalWallet:
        return Icons.account_balance_wallet_outlined;
      case AccType.savingsGoal:
        return Icons.savings_outlined;
    }
  }

  static String getAccountTypeLabel(AccType type) {
    switch (type) {
      case AccType.cash:
        return "Cash / Wallet";
      case AccType.bank:
        return "Bank Account";
      case AccType.creditCard:
        return "Credit Card";
      case AccType.debitCard:
        return "Debit Card";
      case AccType.investment:
        return "Investment";
      case AccType.digitalWallet:
        return "Digital Wallet";
      case AccType.savingsGoal:
        return "Savings";
    }
  }
}

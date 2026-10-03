import 'package:hive_flutter/hive_flutter.dart';

enum AccType { cash, bank, creditCard, debitCard, investment, digitalWallet, savingsGoal }

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
        'icon': 'payments',
        'color': 0xFF4CAF50,
      },
      {
        'id': 'acc_2',
        'name': 'Primary Bank',
        'balance': 0,
        'type': AccType.bank,
        'icon': 'account_balance',
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
}

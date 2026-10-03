import 'package:hive_flutter/hive_flutter.dart';

import 'transaction_data.dart';
import 'account_data.dart';

class BreadCrumbsDatabase {
  final TransactionData transactionData = TransactionData();
  final AccountData accountData = AccountData();

  Map settings = {};
  static const String keySettings = "SETTINGS";
  final Box _myDb = Hive.box('breadCrumbsDB');

  void createInitialData() {
    settings = {
      'currency': '\$',
      'userName': 'User',
      'monthlyBudgetGoal': 0,
      'theme': 'system',
    };
    saveSettings();

    accountData.createInitialAccounts();
  }

  void loadData() {
    settings = _myDb.get(keySettings) ?? {};
    transactionData.loadTransactions();
    accountData.loadAccounts();
  }

  void saveSettings() {
    _myDb.put(keySettings, settings);
  }

  List getRecentTransactions({int limit = 10}) =>
      transactionData.getRecentTransactions(limit: limit);
}

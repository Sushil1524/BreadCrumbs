import 'package:hive_flutter/hive_flutter.dart';

import 'account_data.dart';

class TransactionData {
  static const String keyTransactions = "TRANSACTIONS";
  final Box _myDb = Hive.box('breadCrumbsDB');

  List transactions = [];

  void createInitialTransactions() {
    transactions = [
    ];
    saveTransactions();
  }

  void loadTransactions() {
    transactions = _myDb.get(keyTransactions) ?? [];
    if (transactions.isEmpty) {
      createInitialTransactions();
    }
  }

  void saveTransactions() {
    _myDb.put(keyTransactions, transactions);
  }

  void addTransaction(
    Map<String, dynamic> moneyLog, [
    AccountData? accountData,
  ]) {
    transactions.add(moneyLog);
    saveTransactions();

    if (accountData != null) {
      final accountId = moneyLog['accountId']?.toString();
      final amount = (moneyLog['amount'] as num?)?.toDouble() ?? 0.0;
      final type = moneyLog['type']?.toString() ?? 'expense';
      accountData.updateBalance(accountId, amount, type);
    } else {
      deleteTransaction(moneyLog['id']);
    }
  }

  void deleteTransaction(String id, [AccountData? accountData]) {
    final index = transactions.indexWhere((moneyLog) => moneyLog['id'] == id);
    if (index >= 0 && index < transactions.length) {
      final moneyLog = transactions[index];
      if (accountData != null) {
        final accountId = moneyLog['accountId']?.toString();
        final amount = (moneyLog['amount'] as num?)?.toDouble() ?? 0.0;
        final type = moneyLog['type']?.toString() ?? 'expense';
        accountData.updateBalance(accountId, amount, type);
      }

      transactions.removeAt(index);
      saveTransactions();
    }
  }

  List getTransactionsByType(String type) {
    return transactions.where((t) => t['type'] == type).toList();
  }

  List getTransactionsByAccount(String accountId) {
    return transactions.where((t) => t['accountId'] == accountId).toList();
  }

  List getRecentTransactions({int limit = 10}) {
    final list = List.from(transactions);
    list.sort((a, b) {
      final dateA =
          DateTime.tryParse(a['date']?.toString() ?? '') ?? DateTime(1970);
      final dateB =
          DateTime.tryParse(b['date']?.toString() ?? '') ?? DateTime(1970);
      return dateB.compareTo(dateA);
    });
    return list.take(limit).toList();
  }
  
}

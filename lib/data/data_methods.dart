import 'package:breadcrumbs/data/account_data.dart';
import 'package:breadcrumbs/data/database.dart';
import 'package:breadcrumbs/data/transaction_data.dart';

class DataMethods {
  final breadCrumbsDatabase = BreadCrumbsDatabase();
  final accountData = AccountData();
  final transactionData = TransactionData();

  List getLatestTransactions(int count) {
    return transactionData.getRecentTransactions(limit: count);
  }
}

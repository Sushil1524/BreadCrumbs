import 'package:breadcrumbs/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:breadcrumbs/data/data_methods.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myDb = Hive.box('myDb');
  final breadCrumbsDB = BreadCrumbsDatabase();
  final dataMethods = DataMethods();

  @override
  void initState() {
    if (_myDb.get(dataMethods.getLatestTransactions(10)) == null) {
      breadCrumbsDB.createInitialData();
    } else {
      breadCrumbsDB.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("BreadCrumbs Home"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }
}

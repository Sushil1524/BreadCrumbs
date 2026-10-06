import 'package:breadcrumbs/components/bottom_navbar.dart';
import 'package:breadcrumbs/data/data_methods.dart';
import 'package:breadcrumbs/data/database.dart';
import 'package:breadcrumbs/style.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myDb = Hive.box('breadCrumbsDB');
  final breadCrumbsDB = BreadCrumbsDatabase();
  final dataMethods = DataMethods();

  @override
  void initState() {
    if (_myDb.get(BreadCrumbsDatabase.keySettings) == null) {
      breadCrumbsDB.createInitialData();
    } else {
      breadCrumbsDB.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("BreadCrumbs Home", style: appBarTextStyle),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Text("Home Screen", style: bodyTextStyle)),
      bottomNavigationBar: const BottomNavbar(currentScreen: 0),
    );
  }
}

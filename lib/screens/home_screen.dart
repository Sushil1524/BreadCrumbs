import 'package:breadcrumbs/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:breadcrumbs/data/data_methods.dart';
import 'package:breadcrumbs/components/bottom_navbar.dart';

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "BreadCrumbs Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text("Home Screen", style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}

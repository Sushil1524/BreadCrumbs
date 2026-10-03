import 'package:breadcrumbs/screens/accounts_screen.dart';
import 'package:breadcrumbs/screens/home_screen.dart';
import 'package:breadcrumbs/screens/settings_screen.dart';
import 'package:breadcrumbs/screens/stats_screen.dart';
import 'package:breadcrumbs/screens/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('breadCrumbsDB');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/accounts': (context) => AccountsScreen(),
        '/settings': (context) => SettingsScreen(),
        '/stats': (context) => StatsScreen(),
        '/transactions': (context) => TransactionsScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

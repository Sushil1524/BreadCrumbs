import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black54,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/transactions');
            break;
          case 2:
            Navigator.pushNamed(context, '/stats');
            break;
          case 3:
            Navigator.pushNamed(context, '/accounts');
            break;
          case 4:
            Navigator.pushNamed(context, '/settings');
            break;
        }
      },
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.amber,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Transactions",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: "Stats"),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
          label: "Accounts",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}

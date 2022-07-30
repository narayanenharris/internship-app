import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: const Color.fromARGB(255, 255, 0, 0),
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Bookings",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: "Wallet",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notifications",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help),
          label: "Support",
        ),
      ],
    );
  }
}

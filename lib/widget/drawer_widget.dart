import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 12.0,
              bottom: 16.0,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'mail@domain.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.query_stats),
            iconColor: Colors.white,
            onTap: () {},
            title: const Text(
              'Dashboard',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.discount),
            iconColor: Colors.white,
            onTap: () {},
            title: const Text(
              'Offers',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.percent),
            iconColor: Colors.white,
            onTap: () {},
            title: const Text(
              'Your Coupons',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.percent),
            iconColor: Colors.white,
            onTap: () {},
            title: const Text(
              'Additional Coupons',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.group),
            iconColor: Colors.white,
            onTap: () {},
            title: const Text(
              'Your Referrals',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.gamepad),
            iconColor: Colors.white,
            onTap: () {},
            title: const Text(
              'Lucky Draw',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.handshake),
            iconColor: Colors.white,
            onTap: () {},
            title: const Text(
              'Our Partner',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.upgrade),
            iconColor: Colors.white,
            onTap: () {},
            title: const Text(
              'Upgrade',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            iconColor: Colors.white,
            onTap: () {},
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            iconColor: Colors.white,
            onTap: () {},
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

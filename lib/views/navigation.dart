import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:park_it/views/login_page.dart';
import 'package:park_it/views/payment_history_page.dart';
import './home_page.dart';
import './regions_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [HomePage(drawer: _buildDrawer()), RegionsPage(drawer: _buildDrawer()), PaymentHistory(drawer: _buildDrawer(),)];
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF5D89FA),
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Regions', icon: Icon(Icons.map_outlined)),
          BottomNavigationBarItem(label: 'History', icon: Icon(Icons.history)),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text('user'),
              accountEmail: Text(FirebaseAuth.instance.currentUser!.email!)),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('profile'),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('settings'),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.feedback_rounded),
            title: const Text('feedback'),
            onTap: (){},
          ),
          Divider(color: Colors.grey.shade400, indent: 10.0, endIndent: 10.0),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('log out'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (constext) => const LoginPage()),
              );
            },
          ),
          
        ],
      ),
    );
  }
}

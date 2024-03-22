import 'package:flutter/material.dart';

import 'favorite_page.dart';
import 'home_page.dart';
import 'news_page.dart';
import 'profile_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    const NewsPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home_filled,
              size: 25,
              color: Colors.black38,
            ),
            activeIcon: Column(
              children: [
                const Icon(
                  Icons.home_filled,
                  size: 25,
                  color: Colors.black38,
                ),
                const SizedBox(height: 5),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.dashboard_outlined,
              size: 25,
              color: Colors.black38,
            ),
            activeIcon: Column(
              children: [
                const Icon(
                  Icons.dashboard_outlined,
                  size: 25,
                  color: Colors.black38,
                ),
                const SizedBox(height: 5),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.favorite_border_outlined,
              size: 25,
              color: Colors.black38,
            ),
            activeIcon: Column(
              children: [
                const Icon(
                  Icons.favorite_border_outlined,
                  size: 25,
                  color: Colors.black38,
                ),
                const SizedBox(height: 5),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person_2_outlined,
              size: 25,
              color: Colors.black38,
            ),
            activeIcon: Column(
              children: [
                const Icon(
                  Icons.person_2_outlined,
                  size: 25,
                  color: Colors.black38,
                ),
                const SizedBox(height: 5),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              ],
            ),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}

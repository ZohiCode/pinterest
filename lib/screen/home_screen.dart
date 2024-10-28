import 'package:flutter/material.dart';
import 'package:pinterest/constants/app_icons.dart';
import '../constants/app_colors.dart';
import '../pages/home_page.dart';
import '../pages/search_page.dart';
import '../pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Change body depending on selected index
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 13,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedFontSize: 12,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(AppIcons.home_filled,size: 35,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.search,size: 35,),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 35,),
            label: 'Profile',
          ),
        ],

      ),
    );
  }
}


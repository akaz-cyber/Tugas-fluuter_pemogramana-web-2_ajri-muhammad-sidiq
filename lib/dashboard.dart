import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:floaty_nav_bar/floaty_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:tugas1_flutter/dashboardHome.dart';
import 'package:tugas1_flutter/homeScreen.dart';
import 'package:tugas1_flutter/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late PageController _pageController;
  int selectedTab = 0;

  void changeTab(int index) {
    _pageController.jumpToPage(index);
    setState(() => selectedTab = index);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => selectedTab = index);
        },
        children: const [
          Dashboardhome(),
          Center(child: Text('Search')),
          Profile(),
        ],
      ),
      bottomNavigationBar: FloatyNavBar(
        selectedTab: selectedTab,
        tabs: [
          FloatyTab(
            isSelected: selectedTab == 0,
            title: 'Home',
            icon: Icon(Icons.home),
            onTap: () => changeTab(0),
          ),
          FloatyTab(
            isSelected: selectedTab == 1,
            title: 'Search',
            icon: Icon(Icons.search),
            onTap: () => changeTab(1),
          ),
          FloatyTab(
            isSelected: selectedTab == 2,
            title: 'Profile',
            icon: Icon(Icons.person),
            onTap: () => changeTab(2),
          ),
        ],
      ),
    );
  }
}

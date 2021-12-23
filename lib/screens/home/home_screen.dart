import 'package:flutter/material.dart';
import 'package:store_app/models/driver_model.dart';
import 'package:store_app/presentation/resourses/assets_manager.dart';
import 'package:store_app/screens/orders_management/orders_management.dart';
import 'package:store_app/screens/profiles/store_profile/store_profile_management.dart';
import 'package:store_app/screens/selling_management/selling_management.dart';
import 'package:store_app/screens/settings/settings_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<_PagesData> pages = [
    _PagesData(
        iconPath: ImageAssets.userNaivgation,
        title: 'User',
        page: StoreProfileManagement(DriverScreenConfigs(driverProfile))),
    _PagesData(
        iconPath: ImageAssets.sellingNavigation,
        title: 'Selling',
        page: OrdersManagement()),
    _PagesData(
        iconPath: ImageAssets.sellingManagementNavigation,
        title: 'Mangement',
        page: SellingManagement()),
    _PagesData(
        iconPath: ImageAssets.settingNavigation,
        title: 'Settings',
        page: SettinsgScreen()),
  ];

  int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: SafeArea(child: pages[_currentTab].page),
    );
  }

  Widget _bottomNavigationBar() {
    return Builder(builder: (context) {
      final color = Theme.of(context).primaryColor;
      return BottomNavigationBar(
          selectedItemColor: color,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentTab,
          onTap: (index) => setState(() {
                _currentTab = index;
              }),
          showUnselectedLabels: true,
          selectedFontSize: 13.sp,
          unselectedFontSize: 13.sp,
          selectedIconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.primary),
          items: [
            for (int i = 0; i < pages.length; i++)
              BottomNavigationBarItem(
                  icon: Image.asset(
                    pages[i].iconPath,
                    color: _currentTab == i ? color : null,
                  ),
                  label: pages[i].title)
          ]);
    });
  }
}

class _PagesData {
  String iconPath;
  String title;
  Widget page;
  _PagesData({required this.iconPath, required this.title, required this.page});
}

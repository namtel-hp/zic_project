import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:zic_project/screens/home_screen.dart';
import 'package:zic_project/screens/myaccount_screen.dart';
import 'package:zic_project/screens/notification_screen.dart';
import 'package:zic_project/screens/profile_screen.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Widget _child;

  @override
  void initState() {
    _child = HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF75B7E1),
      extendBody: true,
      body: _child,
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
              iconPath: "assets/images/icon_house.svg",
              extras: {"label": "home"}),
          FluidNavBarIcon(
              iconPath: "assets/images/icon_account_balance.svg",
              extras: {"label": "account"}),
          FluidNavBarIcon(
              iconPath: "assets/images/icon_notification.svg",
              extras: {"label": "nptification"}),
          FluidNavBarIcon(
              iconPath: "assets/images/icon_user.svg",
              extras: {"label": "profile"}),
        ],
        onChange: _handleNavigationChange,
        style: FluidNavBarStyle(
          barBackgroundColor: Color(0xFFFFCA28),
          iconBackgroundColor: Color(0xFFFFCA28),
          iconSelectedForegroundColor: Colors.white,
          iconUnselectedForegroundColor: Color(0xFF052C7B),
        ),
        scaleFactor: 1.5,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras["label"],
          child: item,
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeScreen();
          break;
        case 1:
          _child = AccountScreen();
          break;
        case 2:
          _child = NotificationScreen();
          break;
        case 3:
          _child = ProfileScreen();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:nothing_clock/screens/alarms_screen.dart';
import 'package:nothing_clock/screens/clock_screen.dart';
import 'package:nothing_clock/widgets/bottom_bar.dart';
import 'package:nothing_clock/widgets/drawer_popup.dart';
import 'package:nothing_clock/widgets/top_bar.dart';

class Router extends StatefulWidget {
  const Router({super.key});

  @override
  State<Router> createState() => _RouterState();
}

class _RouterState extends State<Router> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<Widget> _screens = [
    ClockScreen(),
    AlarmsScreen(),
    Placeholder(),
    Placeholder(),
  ];

  static const List<String> _topBarTitles = [
    "Clock",
    "Alarms",
    "Timer",
    "Stopwatch",
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    void _onNavBarTap(index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
        bottomNavigationBar: BottomBar(
          theme: theme,
          callback: (index) => _onNavBarTap(index),
        ),
        appBar: TopBar(
            title: _topBarTitles[_selectedIndex], scaffoldKey: _scaffoldKey),
        key: _scaffoldKey,
        endDrawer: const DrawerPopup(),
        body: _screens.elementAt(_selectedIndex));
  }
}

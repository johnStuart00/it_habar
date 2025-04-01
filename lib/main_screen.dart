import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:it_habar/core/assets/app_icons.dart';
import 'package:it_habar/features/global_screen/presentation/global_screen.dart';
import 'package:it_habar/features/home_screen/presentation/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    GlobalScreen(),
    Text(
      'Notes',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.bottomNavigationBarTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              // ignore: deprecated_member_use
              color: theme.dividerColor.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor:
                  theme.bottomNavigationBarTheme.selectedIconTheme!.color,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor:
                  theme.bottomNavigationBarTheme.selectedItemColor!,
              color: theme.bottomNavigationBarTheme.unselectedItemColor!,
              tabs: [
                GButton(
                  icon: AppIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: AppIcons.global,
                  text: 'Global',
                ),
                GButton(
                  icon: AppIcons.noted,
                  text: 'Noted',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

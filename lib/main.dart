import 'package:flutter/material.dart';
import 'package:sider/drawer_tab.dart';
import 'package:sider/expandable_drawer_tab.dart';
import 'package:sider/side_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color.fromARGB(255, 64, 214, 104);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            SideDrawer(
              backgroundColor: const Color.fromARGB(255, 64, 214, 104),
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: Center(
                    child: Text(
                      'App Drawer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                DrawerTab(
                  tileColor: backgroundColor,
                  title: 'Dashboard',
                  // icon: Icons.dashboard,
                  tabId: 1,
                ),
                DrawerTab(
                  tileColor: backgroundColor,
                  title: 'Settings',
                  // icon: Icons.settings,
                  tabId: 2,
                ),
                ExpandableDrawerTab(
                  expandedTextStyle: TextStyle(color: Colors.white),
                  collapsedTextStyle: TextStyle(color: Colors.white),
                  title: 'Projects',
                  tabId: 3,
                  children: [
                    DrawerTab(
                        tileColor: backgroundColor,
                        title: 'Project 1',
                        tabId: 31,
                        isChild: true),
                    DrawerTab(
                        tileColor: backgroundColor,
                        title: 'Project 2',
                        tabId: 32,
                        isChild: true),
                  ],
                ),
                ExpandableDrawerTab(
                  collapsedTextStyle: TextStyle(color: Colors.white),
                  expandedTextStyle: TextStyle(color: Colors.white),
                  title: 'Reports',
                  tabId: 4,
                  children: [
                    DrawerTab(
                        tileColor: backgroundColor,
                        title: 'Report 1',
                        tabId: 41,
                        isChild: true),
                    DrawerTab(
                        tileColor: backgroundColor,
                        title: 'Report 2',
                        tabId: 42,
                        isChild: true),
                  ],
                ),
                DrawerTab(
                  tileColor: backgroundColor,
                  title: 'About',
                  // icon: Icons.info,
                  tabId: 5,
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: ValueListenableBuilder<int>(
                  valueListenable: SideDrawer.activeTabNotifier,
                  builder: (context, activeTab, child) {
                    return Text(
                      'Selected Tab: $activeTab',
                      style: TextStyle(fontSize: 24),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

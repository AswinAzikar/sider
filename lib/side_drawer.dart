import 'package:flutter/material.dart';
import 'package:sider/drawer_tab.dart';
import 'package:sider/expandable_drawer_tab.dart';

class SideDrawer extends StatelessWidget {
  static final ValueNotifier<int> activeTabNotifier = ValueNotifier<int>(0);
  final Color? backgroundColor;
  final Widget? headerWidget;

  const SideDrawer({super.key, this.backgroundColor, this.headerWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: backgroundColor ?? Colors.blueGrey[900],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          headerWidget ??
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
            icon: Icons.dashboard,
            tabId: 1,
          ),
          DrawerTab(
            tileColor: backgroundColor,
            title: 'Settings',
            icon: Icons.settings,
            tabId: 2,
          ),
          ExpandableDrawerTab(
            title: 'Projects',
            icon: Icons.folder,
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
            title: 'Reports',
            icon: Icons.analytics,
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
            icon: Icons.info,
            tabId: 5,
          ),
        ],
      ),
    );
  }
}

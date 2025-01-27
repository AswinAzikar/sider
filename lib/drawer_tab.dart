import 'package:flutter/material.dart';
import 'package:sider/side_drawer.dart';

class DrawerTab extends StatelessWidget {
  final String title;
  final IconData? icon;
  final int tabId;
  final bool isChild;
  final Color? tileColor;

  const DrawerTab({
    super.key,
    required this.title,
    required this.tabId,
    this.icon,
    this.isChild = false,
    this.tileColor,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: SideDrawer.activeTabNotifier,
      builder: (context, activeTab, child) {
        return Container(
          decoration: BoxDecoration(
            color: activeTab == tabId
                ? Colors.blue
                : tileColor ?? Colors.blueGrey[900],
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: ListTile(
            leading: icon != null ? Icon(icon, color: Colors.white) : null,
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight:
                    activeTab == tabId ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            contentPadding:
                isChild ? EdgeInsets.only(left: 32.0) : EdgeInsets.zero,
            onTap: () {
              SideDrawer.activeTabNotifier.value = tabId;
            },
          ),
        );

        // return ListTile(
        //   shape: RoundedRectangleBorder(

        //     borderRadius: BorderRadius.only(
        //       topRight: Radius.circular(20),
        //       bottomRight: Radius.circular(20),
        //     ),
        //   ),
        //   leading: icon != null ? Icon(icon, color: Colors.white) : null,
        //   title: Text(
        //     title,
        //     style: TextStyle(
        //       color: activeTab == tabId ? Colors.blue : Colors.white,
        //       fontWeight:
        //           activeTab == tabId ? FontWeight.bold : FontWeight.normal,
        //     ),
        //   ),
        //   contentPadding:
        //       isChild ? EdgeInsets.only(left: 32.0) : EdgeInsets.zero,
        //   onTap: () {
        //     SideDrawer.activeTabNotifier.value = tabId;
        //   },
        // );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sider/side_drawer.dart';

class ExpandableDrawerTab extends StatelessWidget {
  final String title;
  final Widget? leading;
  final int tabId;
  final List<Widget> children;

  const  ExpandableDrawerTab({
    super.key,
    required this.title,
   this.leading,
    required this.tabId,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(

      leading: leading??SizedBox(),
      title: ValueListenableBuilder<int>(
        valueListenable: SideDrawer.activeTabNotifier,
        builder: (context, activeTab, child) {
          return Text(
            title,
            style: TextStyle(
              color: activeTab == tabId ? Colors.blue : Colors.white,
              fontWeight:
                  activeTab == tabId ? FontWeight.bold : FontWeight.normal,
            ),
          );
        },
      ),
      children: children,
      onExpansionChanged: (expanded) {
        if (expanded) {
          SideDrawer.activeTabNotifier.value = tabId;
        }
      },
    );
  }
}

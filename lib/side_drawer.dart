// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';



class SideDrawer extends StatelessWidget {
  static final ValueNotifier<int> activeTabNotifier = ValueNotifier<int>(0);
  final Color? backgroundColor;
final List<Widget> children;

  const SideDrawer({
    super.key,
    this.backgroundColor,
   required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: backgroundColor ?? Colors.blueGrey[900],
      child: ListView(
        padding: EdgeInsets.all(8),
        children:children,
      ),
    );
  }
}

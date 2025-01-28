// ignore_for_file: public_member_api_docs, sort_constructors_first
// This file contains the SideDrawer widget which is a custom drawer that can be used in the app.
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  static final ValueNotifier<int> activeTabNotifier = ValueNotifier<int>(0);
  final Color? backgroundColor;
  final List<Widget> children;
  final double? width;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  final BorderRadius? borderRadiusOfSideBar;
  final BlendMode? sideBarBackgroundBlendMode;
  final EdgeInsetsGeometry? sideBarPadding;
  final EdgeInsetsGeometry? sideListPadding;
  final bool? shrinkWrap;

  const SideDrawer({
    super.key,
    this.backgroundColor,
    required this.children,
    this.width,
    this.boxShadow,
    this.border,
    this.borderRadiusOfSideBar,
    this.sideBarBackgroundBlendMode,
    this.sideBarPadding,
    this.sideListPadding,
    this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      padding: sideBarPadding ?? EdgeInsets.all(0),
      width: width ?? screenWidth * .2,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.blueGrey[900],
        boxShadow: boxShadow ?? [],
        border: border ?? Border(),
        borderRadius:
            borderRadiusOfSideBar ?? BorderRadius.all(Radius.circular(0)),
        backgroundBlendMode: sideBarBackgroundBlendMode ?? BlendMode.darken,
      ),
      child: ListView(
        shrinkWrap: shrinkWrap ?? false,
        padding: sideListPadding ?? EdgeInsets.all(8),
        children: children,
      ),
    );
  }
}

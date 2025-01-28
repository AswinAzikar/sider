/// This file contains the `SideDrawer` widget which is a custom drawer that can be used in a Flutter application.
library;

import 'package:flutter/material.dart';

/// A custom side drawer widget that can be used in a Flutter application.
///
/// The `SideDrawer` widget provides a customizable side drawer with various
/// properties to control its appearance and behavior.
///
/// The `SideDrawer` widget is a stateless widget that takes the following parameters:
///
/// * `backgroundColor`: The background color of the side drawer.
/// * `children`: A list of widgets to be displayed inside the side drawer.
/// * `width`: The width of the side drawer.
/// * `boxShadow`: A list of box shadows to be applied to the side drawer.
/// * `border`: The border of the side drawer.
/// * `borderRadiusOfSideBar`: The border radius of the side drawer.
/// * `sideBarBackgroundBlendMode`: The blend mode for the background of the side drawer.
/// * `sideBarPadding`: The padding inside the side drawer.
/// * `sideListPadding`: The padding for the list of children inside the side drawer.
/// * `shrinkWrap`: Whether the list of children should shrink wrap its content.
/// * `gradient`: A gradient to be applied to the background of the side drawer.
/// * `pageMap`: A map of pages to be displayed in the side drawer.
///
/// Example usage:
/// ```dart
/// SideDrawer(
///   backgroundColor: Colors.white,
///   children: [
///    DrawerHeader(...),
///    DrawerTab(...),
///    ExpandableDrawerTab(...),
///    ListTile(title: Text('Item n')),
///   ],
///   width: 250,
///   boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
///   border: Border.all(color: Colors.grey),
///   borderRadiusOfSideBar: BorderRadius.circular(10),
///   sideBarBackgroundBlendMode: BlendMode.overlay,
///   sideBarPadding: EdgeInsets.all(16),
///   sideListPadding: EdgeInsets.symmetric(vertical: 8),
///   shrinkWrap: true,
///   gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
///   pageMap: {
///     0: HomePage(),
///     1: SettingsPage(),
///   },
/// )
/// ```
// ignore_for_file: public_member_api_docs, sort_constructors_first

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
  final Gradient? gradient;
  final Map<int, Widget> pageMap;

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
    this.gradient,
    required this.pageMap,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      padding: sideBarPadding ?? EdgeInsets.all(0),
      width: width ?? screenWidth * .2,
      decoration: gradient != null
          ? BoxDecoration(
              gradient: gradient,
              boxShadow: boxShadow ?? [],
              border: border ?? Border(),
              borderRadius:
                  borderRadiusOfSideBar ?? BorderRadius.all(Radius.circular(0)),
              backgroundBlendMode:
                  sideBarBackgroundBlendMode ?? BlendMode.darken,
            )
          : BoxDecoration(
              color: backgroundColor ?? Colors.blueGrey[900],
              boxShadow: boxShadow ?? [],
              border: border ?? Border(),
              borderRadius:
                  borderRadiusOfSideBar ?? BorderRadius.all(Radius.circular(0)),
              backgroundBlendMode:
                  sideBarBackgroundBlendMode ?? BlendMode.darken,
            ),
      child: ListView(
        shrinkWrap: shrinkWrap ?? false,
        padding: sideListPadding ?? EdgeInsets.all(8),
        children: children,
      ),
    );
  }
}

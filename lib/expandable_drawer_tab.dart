// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sider/side_drawer.dart';

class ExpandableDrawerTab extends StatelessWidget {
  final String title;
  final Widget? leading;
  final int tabId;
  final List<Widget> children;
  final EdgeInsetsGeometry? childrenPadding;
  // final Color? expansionTileBackgroundColor;
  final bool? initiallyExpanded;
  final bool? isInteractive;
  final Color? collapsedBackgroundColor;
  final ShapeBorder? collapsedShape;
  final Color? collapsedIconColor;
  final Color? collapsedTextColor;
  final Color? expandedBackgroundColor;
  final ShapeBorder? expandedShape;
  final Color? expandedIconColor;
  final Color? expandedTextColor;
  final Decoration? tileDecoration;
  final TextStyle expandedTextStyle;
  final TextStyle collapsedTextStyle;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final Widget? subtitle;
  final bool? showTrailingIcon;
  final AnimationStyle? expansionAnimationStyle;
  final Widget? trailing;
  final Alignment? expandedAlignment;
  const ExpandableDrawerTab({
    super.key,
    // this.expansionTileBackgroundColor,
    required this.title,
    this.leading,
    required this.tabId,
    required this.children,
    this.childrenPadding,
    this.initiallyExpanded,
    this.isInteractive,
    this.collapsedBackgroundColor,
    this.collapsedShape,
    this.collapsedIconColor,
    this.collapsedTextColor,
    this.expandedBackgroundColor,
    this.expandedShape,
    this.expandedIconColor,
    this.expandedTextColor,
    this.tileDecoration,
    required this.expandedTextStyle,
    required this.collapsedTextStyle,
    this.expandedCrossAxisAlignment,
    this.subtitle,
    this.showTrailingIcon,
    this.expansionAnimationStyle,
    this.trailing,
    this.expandedAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      textColor: expandedTextColor ?? Colors.white,
      trailing: trailing,
      tilePadding: EdgeInsets.zero,
      expansionAnimationStyle:
          expansionAnimationStyle ?? AnimationStyle.noAnimation,
      showTrailingIcon: showTrailingIcon ?? true,
      subtitle: subtitle ?? SizedBox(),
      shape: expandedShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
      expandedCrossAxisAlignment:
          expandedCrossAxisAlignment ?? CrossAxisAlignment.end,
      expandedAlignment: expandedAlignment ?? Alignment.centerRight,
      iconColor: expandedIconColor ?? Colors.white,
      collapsedTextColor: collapsedTextColor ?? Colors.white,
      collapsedIconColor: collapsedIconColor ?? Colors.white,
      collapsedShape: collapsedShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
      collapsedBackgroundColor: collapsedBackgroundColor ?? Colors.transparent,
      enabled: isInteractive ?? true,
      initiallyExpanded: initiallyExpanded ?? false,
      backgroundColor: expandedBackgroundColor ?? Colors.transparent,
      childrenPadding: childrenPadding ?? EdgeInsets.all(0),
      leading: leading,
      title: ValueListenableBuilder<int>(
        valueListenable: SideDrawer.activeTabNotifier,
        builder: (context, activeTab, child) {
          return Container(
            decoration: tileDecoration ?? BoxDecoration(),
            child: Text(
              title,
              style:
                  activeTab == tabId ? expandedTextStyle : collapsedTextStyle,
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

/// A widget that represents an expandable drawer tab with customizable properties.
///
/// The [ExpandableDrawerTab] widget is a stateless widget that displays an
/// expandable tile with a title, leading widget, and a list of child widgets.
/// It provides various customization options for the appearance and behavior
/// of the tile in both collapsed and expanded states.
///
/// The widget uses an [ExpansionTile] internally to handle the expansion and
/// collapse behavior. It also integrates with the [SideDrawer] to manage the
/// active tab state.
///
/// ## Parameters:
///
/// - `title` (required): The title of the expandable drawer tab.
/// - `leading`: An optional widget to display before the title.
/// - `tabId` (required): An identifier for the tab used to manage the active state.
/// - `children` (required): A list of widgets to display as the children of the expandable tile.
/// - `childrenPadding`: Padding for the children widgets.
/// - `initiallyExpanded`: Whether the tile is initially expanded.
/// - `isInteractive`: Whether the tile is interactive.
/// - `collapsedBackgroundColor`: Background color of the tile when collapsed.
/// - `collapsedShape`: Shape of the tile when collapsed.
/// - `collapsedIconColor`: Icon color of the tile when collapsed.
/// - `collapsedTextColor`: Text color of the tile when collapsed.
/// - `expandedBackgroundColor`: Background color of the tile when expanded.
/// - `expandedShape`: Shape of the tile when expanded.
/// - `expandedIconColor`: Icon color of the tile when expanded.
/// - `expandedTextColor`: Text color of the tile when expanded.
/// - `tileDecoration`: Decoration for the tile container.
/// - `expandedTextStyle` (required): Text style for the title when expanded.
/// - `collapsedTextStyle` (required): Text style for the title when collapsed.
/// - `expandedCrossAxisAlignment`: Cross-axis alignment of the children when expanded.
/// - `subtitle`: An optional subtitle widget to display below the title.
/// - `showTrailingIcon`: Whether to show the trailing icon.
/// - `expansionAnimationStyle`: Animation style for the expansion.
/// - `trailing`: An optional widget to display at the end of the tile.
/// - `expandedAlignment`: Alignment of the children when expanded.
///
/// ## Example:
///
/// ```dart
/// ExpandableDrawerTab(
///   title: 'Tab Title',
///   tabId: 1,
///   children: [
///     ListTile(title: Text('Child 1')),
///     ListTile(title: Text('Child 2')),
///   ],
///   expandedTextStyle: TextStyle(color: Colors.blue),
///   collapsedTextStyle: TextStyle(color: Colors.grey),
/// );
/// ```
library;
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

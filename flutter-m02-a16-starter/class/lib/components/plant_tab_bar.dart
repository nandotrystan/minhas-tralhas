import 'package:flutter/material.dart';

class PlantTabBar extends StatelessWidget implements PreferredSizeWidget {
  const PlantTabBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<Tab> tabs;

  @override
  Size get preferredSize => const Size.fromHeight(83.0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.topLeft,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        labelPadding: const EdgeInsets.only(left: 17.0, right: 45.0),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 3,
            color: theme.colorScheme.secondary,
          ),
          insets: const EdgeInsets.only(
            left: 17.0,
            bottom: 10.0,
            right: 85.0,
          ),
        ),
      ),
    );
  }
}

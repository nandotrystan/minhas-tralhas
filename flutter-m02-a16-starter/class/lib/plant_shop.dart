import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/blocs/cart_state.dart';
import 'package:plant_shop/blocs/theme_cubit.dart';
import 'package:plant_shop/components/plant_tab_bar.dart';
import 'package:plant_shop/plant_shopping_cart.dart';
import 'package:plant_shop/resources/strings.dart';
import 'package:plant_shop/tabs/plant_tab.dart';
import 'package:plant_shop/utils/plant_helper.dart' as plant_helper;

import 'blocs/cart_bloc.dart';

class PlantShop extends StatelessWidget {
  const PlantShop({Key? key}) : super(key: key);

  final tabs = const [
    Tab(text: Strings.concept),
    Tab(text: Strings.popular),
    Tab(text: Strings.newTab),
  ];

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return DefaultTabController(
      animationDuration: Duration.zero,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appName),
          elevation: 0.0,
          bottom: PlantTabBar(tabs: tabs),
          actions: [
            IconButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => const PlantShoppingCart(),
                isDismissible: false,
                barrierColor: Colors.black.withOpacity(0.7),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
              ),
              icon: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  final theme = Theme.of(context);
                  return Badge(
                      badgeContent: Text(state.count.toString()),
                      badgeColor: theme.colorScheme.secondary,
                      animationType: BadgeAnimationType.scale,
                      animationDuration: const Duration(milliseconds: 200),
                      showBadge: state.cart.isNotEmpty,
                      child: const Icon(Icons.shopping_basket_outlined));
                },
              ),
            ),
            IconButton(
              onPressed: BlocProvider.of<ThemeCubit>(context).toggleThemeMode,
              icon: BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, themeModeState) {
                  return Icon(
                    themeModeState == ThemeMode.light
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined,
                  );
                },
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: tabs
              .map((_) => const PlantTab(plants: plant_helper.plants))
              .toList(),
        ),
      ),
    );
  }
}

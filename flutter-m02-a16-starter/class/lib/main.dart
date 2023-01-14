import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/blocs/theme_cubit.dart';
import 'package:plant_shop/plant_shop.dart';
import 'package:plant_shop/resources/strings.dart';
import 'package:plant_shop/resources/theme.dart';

import 'blocs/cart_bloc.dart';

void main() => runApp(const PlantShopApp());

class PlantShopApp extends StatelessWidget {
  const PlantShopApp({Key? key}) : super(key: key);

  //ThemeMode currentThemeMode = ThemeMode.light;

  // void toggleThemeMode() {
  //   setState(() {
  //     currentThemeMode = currentThemeMode == ThemeMode.light
  //         ? ThemeMode.dark
  //         : ThemeMode.light;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return ThemeCubit(
                WidgetsBinding.instance?.window.platformBrightness ??
                    Brightness.light);
          },
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeModeState) {
          return MaterialApp(
            title: Strings.appName,
            themeMode: themeModeState,
            theme: PlantShopTheme.light,
            darkTheme: PlantShopTheme.dark,
            home: const PlantShop(),
          );
        },
      ),
    );
  }
}

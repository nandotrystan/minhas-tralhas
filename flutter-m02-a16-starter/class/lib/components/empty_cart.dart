import 'package:flutter/material.dart';
import 'package:plant_shop/resources/images.dart';
import 'package:plant_shop/resources/strings.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Strings.emptyCartMessage,
            textAlign: TextAlign.center,
            style: theme.textTheme.headline6,
          ),
          Image.asset(
            Images.happySucculent,
            scale: 3.0,
          ),
        ],
      ),
    );
  }
}
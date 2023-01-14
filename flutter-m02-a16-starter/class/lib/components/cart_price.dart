import 'package:flutter/material.dart';
import 'package:plant_shop/resources/strings.dart';

class CartPrice extends StatelessWidget {
  const CartPrice({Key? key, required this.price}) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 36.0, right: 24.0),
      child: Row(
        children: [
          Text(Strings.total,
              style: theme.textTheme.headline6
                  ?.copyWith(fontWeight: FontWeight.w800)),
          const Spacer(),
          Text(
            'R\$$price',
            style: theme.textTheme.bodyText1
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
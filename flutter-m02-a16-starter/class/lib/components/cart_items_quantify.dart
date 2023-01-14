import 'package:flutter/material.dart';

class CartItemsQuantity extends StatelessWidget {
  const CartItemsQuantity({
    Key? key,
    required this.onItemIncrease,
    required this.onItemDecrease,
    required this.quantity,
  }) : super(key: key);

  final VoidCallback onItemIncrease;
  final VoidCallback onItemDecrease;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 25.0,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            splashRadius: 12.0,
            onPressed: onItemDecrease,
            padding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4),
            icon: Icon(
              Icons.remove,
              size: 14.0,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          Text(quantity,
              style: theme.textTheme.bodyText1
                  ?.copyWith(fontWeight: FontWeight.w800)),
          IconButton(
            splashRadius: 12.0,
            onPressed: onItemIncrease,
            padding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4),
            icon: Icon(
              Icons.add,
              size: 14.0,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

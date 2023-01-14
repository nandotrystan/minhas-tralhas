import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/blocs/cart_event.dart';
import 'package:plant_shop/components/cart_items_quantify.dart';
import 'package:plant_shop/components/cart_price.dart';
import 'package:plant_shop/models/cart_item.dart';
import 'package:plant_shop/models/plant.dart';

import 'blocs/cart_bloc.dart';
import 'blocs/cart_state.dart';
import 'resources/strings.dart';
import 'package:plant_shop/utils/plant_helper.dart' as plant_helper;

const _shoppingCardPadding = EdgeInsets.only(left: 36, right: 24);

class PlantShoppingCart extends StatelessWidget {
  const PlantShoppingCart({Key? key}) : super(key: key);

  // final tempPlants = List<Plant>.from(plant_helper.plants);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final tempPrice = tempPlants
    //     .fold<double>(0.0, (total, plant) => total + plant.price)
    //     .toStringAsFixed(2);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: _shoppingCardPadding.copyWith(top: 35),
          child: Row(
            children: [
              Text(
                Strings.shoppingCart.toUpperCase(),
                style: theme.textTheme.headline5
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
              const Spacer(),
              IconButton(
                onPressed: Navigator.of(context).pop,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.close),
                splashRadius: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.cart.isEmpty) return Empy
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.cart.length,
                      itemBuilder: (context, index) {
                        final cartItem = state.cart[index];
                        // final plant = tempPlants[index];
                        return ListTile(
                          contentPadding: _shoppingCardPadding,
                          title: Text(cartItem.plant.name),
                          leading: CircleAvatar(
                            foregroundImage: AssetImage(cartItem.plant.image),
                          ),
                          trailing: CartItemsQuantity(
                              onItemIncrease: () =>
                                  BlocProvider.of<CartBloc>(context)
                                      .add(CartAdded(cartItem: cartItem)),
                              onItemDecrease: () =>
                                  BlocProvider.of<CartBloc>(context)
                                      .add(CartRemoved(cartItem: cartItem)),
                              quantity: cartItem.quantify.toString()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  CartPrice(price: state.total),
                  const SizedBox(height: 5),
                  Padding(
                    padding: _shoppingCardPadding,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(Strings.finishPurchase),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

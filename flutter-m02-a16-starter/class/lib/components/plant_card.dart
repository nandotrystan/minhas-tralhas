import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/blocs/cart_bloc.dart';
import 'package:plant_shop/blocs/cart_event.dart';
import 'package:plant_shop/models/cart_item.dart';
import 'package:plant_shop/models/plant.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({
    Key? key,
    required this.plant,
    required this.isCardActive,
  }) : super(key: key);

  final Plant plant;
  final bool isCardActive;

  @override
  Widget build(BuildContext context) {
    final verticalPadding = isCardActive ? 102.0 : 140.0;
    final theme = Theme.of(context);

    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
      padding: EdgeInsets.fromLTRB(25, verticalPadding, 5, verticalPadding),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 31.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(plant.name, style: theme.textTheme.headlineSmall),
              const SizedBox(height: 7.0),
              Text(
                plant.dimension.toString(),
                style: theme.textTheme.bodySmall,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 31.0),
                  child: Image.asset(plant.image),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _PlantPrice(plant: plant),
                  ElevatedButton(
                    onPressed: () => BlocProvider.of<CartBloc>(context).add(
                      CartAdded(
                        cartItem: CartItem(plant: plant, quantify: 1),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(60),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20.0)),
                      ),
                      elevation: 0.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlantPrice extends StatelessWidget {
  const _PlantPrice({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'R\$',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              )),
          TextSpan(
              text: plant.price.truncate().toString(),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
              )),
          TextSpan(
              text: '.',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 18.0,
              )),
          TextSpan(
              text: plant.price.toString().split('.').last,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 14.0,
              ))
        ],
      ),
    );
  }
}

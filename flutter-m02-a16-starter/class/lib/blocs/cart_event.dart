import 'package:plant_shop/models/cart_item.dart';

abstract class CartEvent {
  const CartEvent();
}

class CartAdded extends CartEvent {
  const CartAdded({required this.cartItem});
  final CartItem cartItem;
}

class CartRemoved extends CartEvent {
  const CartRemoved({required this.cartItem});
  final CartItem cartItem;
}

import 'package:plant_shop/models/cart_item.dart';

class CartState {
  const CartState({required this.cart});
  final List<CartItem> cart;

  String get total => cart
      .fold<double>(0.0, (total, cartItem) => total + cartItem.plant.price)
      .toStringAsFixed(2);

  int get count => cart
      .fold(0, (total, cartItem) => total + cartItem.quantify);
}

import 'package:collection/collection.dart';

import 'package:bloc/bloc.dart';
import 'package:plant_shop/models/cart_item.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(cart: [])) {
    on<CartAdded>(_onCartAdded);
    on<CartRemoved>(_onCartRemoved);
  }

  void _onCartAdded(CartAdded event, Emitter<CartState> emit) {
    final newCart = List<CartItem>.from(state.cart);
    final cartItem = state.cart.firstWhereOrNull(
        (cartItem) => cartItem.plant.name == event.cartItem.plant.name);

    if (cartItem != null) {
      newCart[newCart.indexOf(cartItem)] =
          CartItem(plant: cartItem.plant, quantify: cartItem.quantify + 1);
    } else {
      newCart.add(event.cartItem);
    }

    emit(CartState(cart: newCart));
  }

  void _onCartRemoved(CartRemoved event, Emitter<CartState> emit) {
    final newCart = List<CartItem>.from(state.cart);
    final cartItem = state.cart.firstWhere(
        (cartItem) => cartItem.plant.name == event.cartItem.plant.name);
    if (cartItem.quantify > 1) {
      newCart[newCart.indexOf(cartItem)] =
          CartItem(plant: cartItem.plant, quantify: cartItem.quantify - 1);
    } else {
      newCart.remove(event.cartItem);
    }

    emit(CartState(cart: newCart));
  }
}

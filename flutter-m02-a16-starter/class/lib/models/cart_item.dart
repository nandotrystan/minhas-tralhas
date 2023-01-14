import 'package:plant_shop/models/plant.dart';

class CartItem {
  const CartItem({required this.plant, required this.quantify});
  
  final Plant plant;
  final int quantify;
}

import 'package:plant_shop/models/plant_dimension.dart';

class Plant {
  const Plant(this.name, this.dimension, this.image, this.price);

  final String name;
  final PlantDimension dimension;
  final String image;
  final double price;
}

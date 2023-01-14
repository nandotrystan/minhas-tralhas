import 'package:plant_shop/resources/strings.dart';

class PlantDimension {
  const PlantDimension(this.width, this.height);

  final int width; // cm
  final int height; // cm

  @override
  String toString() => Strings.dimension(width, height);
}

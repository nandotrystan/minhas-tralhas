import 'package:plant_shop/models/plant.dart';
import 'package:plant_shop/models/plant_dimension.dart';
import 'package:plant_shop/resources/images.dart';

const plants = [
  Plant('Astrophytum', PlantDimension(23, 21), Images.astrophytum, 23.99),
  Plant('Cowboy Cactus', PlantDimension(19, 70), Images.cowboyCactus, 299.99),
  Plant('Dioon Spinulosum', PlantDimension(15, 30), Images.dioonSpinulosum,
      32.99),
  Plant('Echeveria Apus', PlantDimension(20, 21), Images.echeveriaApus, 49.99),
  Plant('Gasteria Glomerata', PlantDimension(22, 35), Images.gasteriaGlomerata,
      15.99),
  Plant('Hercules', PlantDimension(12, 15), Images.hercules, 9.99),
  Plant('Portulacaria Afra', PlantDimension(10, 28), Images.portulacariaAfra,
      19.99),
];

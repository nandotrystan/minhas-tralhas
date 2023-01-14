import 'package:flutter/material.dart';
import 'package:plant_shop/components/plant_card.dart';
import 'package:plant_shop/models/plant.dart';

class PlantTab extends StatefulWidget {
  const PlantTab({Key? key, required this.plants}) : super(key: key);

  final List<Plant> plants;

  @override
  State<PlantTab> createState() => _PlantTabState();
}

class _PlantTabState extends State<PlantTab> {
  final pageController = PageController(viewportFraction: 0.8);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      padEnds: false,
      controller: pageController,
      itemCount: widget.plants.length,
      onPageChanged: (newPage) => setState(() {
        currentPage = newPage;
      }),
      itemBuilder: (context, index) {
        final plant = widget.plants[index];
        return PlantCard(plant: plant, isCardActive: index == currentPage);
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

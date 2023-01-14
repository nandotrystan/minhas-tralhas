import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon/resources/icons.dart';

class GradientPokeball extends StatelessWidget {
  const GradientPokeball({
    Key? key,
    required this.gradient,
    this.height,
  }) : super(key: key);

  final Gradient gradient;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: SvgPicture.asset(
        PokemonIcons.pokeball,
        fit: BoxFit.fitWidth,
        height: height,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}

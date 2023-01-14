import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/resources/icons.dart';

class GradientPattern extends StatelessWidget {
  const GradientPattern({
    Key? key,
    required this.gradient,
  }) : super(key: key);

  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: SvgPicture.asset(
        PokemonIcons.pattern6x3,
        fit: BoxFit.fitWidth,
        height: 32.0,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}

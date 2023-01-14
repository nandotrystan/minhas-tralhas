import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TypeBadge extends StatelessWidget {
  const TypeBadge({
    Key? key,
    required this.icon,
    required this.typeName,
    required this.typeColor,
  }) : super(key: key);

  final String icon;
  final String typeName;
  final Color typeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 5.0),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Text(
              typeName,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          )
        ],
      ),
    );
  }
}

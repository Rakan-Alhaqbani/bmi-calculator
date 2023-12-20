import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.iconh, required this.label});
  final Icon iconh;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconh,
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: labelStyle,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class SquareFeatureButton extends StatelessWidget {
  final String labelText;
  final IconData icon;

  const SquareFeatureButton({
    Key? key,
    required this.labelText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 50,
            color: Colors.white,
          ),
        ),
        Text(labelText)
      ],
    );
  }
}

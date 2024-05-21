import 'package:flutter/material.dart';

class InformationCar extends StatelessWidget {
  final String title;
  final String detail;
  final double verticalPadding;

  const InformationCar({
    Key? key,
    required this.title,
    required this.detail,
    this.verticalPadding = 0.0, // Default to no vertical padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            detail,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

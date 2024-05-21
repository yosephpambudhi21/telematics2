// circle_button.dart
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String text;
  final IconData iconData; // Add icon data
  final VoidCallback onPressed;
  final double size;

  const CircleButton({
    Key? key,
    required this.text,
    required this.iconData,
    required this.onPressed,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(size),
            backgroundColor: Colors.white,
            shadowColor: Colors.grey,
            elevation: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Colors.black,
                size: 30, // Set the desired icon size
              ),
              SizedBox(height: 5), // Add some spacing between icon and text
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}

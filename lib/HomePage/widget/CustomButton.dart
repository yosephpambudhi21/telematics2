import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Widget? child;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.backgroundColor,
      required this.textColor,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: child ??
          Container(
            width: double.infinity,
            child: Center(child: Text(text)),
          ),
    );
  }
}

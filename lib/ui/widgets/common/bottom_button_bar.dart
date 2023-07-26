import 'package:flutter/material.dart';

class BottomButtonBar extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const BottomButtonBar({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          foregroundColor: color,
        ),
        child: Text(
          label,
          style: const TextStyle(
            letterSpacing: 1.4,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

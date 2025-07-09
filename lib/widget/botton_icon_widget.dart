import 'package:flutter/material.dart';

class BottonIconWidget extends StatelessWidget {
  const BottonIconWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(icon, size: 25),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }
}

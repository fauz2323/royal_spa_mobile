import 'package:flutter/material.dart';

class BottonIconWidget extends StatelessWidget {
  const BottonIconWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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

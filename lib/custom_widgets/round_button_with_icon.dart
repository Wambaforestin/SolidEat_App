import 'package:flutter/material.dart';

class RoundButtonIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  final Color color;
  const RoundButtonIcon(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon,
      required this.color
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: color, width: 2.0),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

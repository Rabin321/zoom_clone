import 'package:flutter/material.dart';

import 'package:zoom_clone/utils/colors.dart';

class ButtonHome extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const ButtonHome({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 3),
                  blurRadius: 10,
                ),
              ],
            ),
            width: 60,
            height: 60,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(color: Color.fromARGB(255, 204, 203, 203)),
          )
        ],
      ),
    );
  }
}

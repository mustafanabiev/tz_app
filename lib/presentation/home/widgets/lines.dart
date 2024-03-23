import 'package:flutter/material.dart';

class Lines extends StatelessWidget {
  const Lines({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      child: Container(
        height: 5,
        width: 2,
        color: color,
      ),
    );
  }
}

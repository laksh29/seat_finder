import 'package:flutter/material.dart';

import '../constants/common_constants.dart';
import 'clippers.dart';

class ExampleSeats extends StatelessWidget {
  const ExampleSeats({
    super.key,
    required this.color,
    required this.text,
    this.clipped = false,
  });
  final String text;
  final Color? color;
  final bool clipped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        clipped
            ? ClipPath(
                clipper: DisplayClipper(),
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            : Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
        buildHeight(5),
        Text(
          text,
          style: const TextStyle(fontSize: 10),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class BottomAppBarStroke extends CustomPainter {
  BottomAppBarStroke({
    required this.color,
    required this.width,
  });

  final Color color;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      const CircularNotchedRectangle().getOuterPath(
        Rect.fromLTWH(0, -1, size.width, size.height),
        Rect.fromCircle(
          center: Offset(size.width / 2, 0),
          radius: 38,
        ),
      ),
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

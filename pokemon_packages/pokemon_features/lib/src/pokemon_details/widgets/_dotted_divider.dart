part of '../presentation/page/pokemon_details_page.dart';

class DottedDivider extends CustomPainter {

  DottedDivider({
    required this.color,
    this.ellipseWidth = 2.0,
    this.ellipseHeight = 2.0,
    this.spacing = 2.0,
  });
  final Color color;
  final double ellipseWidth;
  final double ellipseHeight;
  final double spacing;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double startX = 0;
    
    // Draw ellipses across the width
    while (startX < size.width) {
      // Calculate the rectangle bounding box for the ellipse
      final rect = Rect.fromLTWH(
        startX,
        (size.height - ellipseHeight) / 2, // Center vertically
        ellipseWidth,
        ellipseHeight,
      );
      
      canvas.drawOval(rect, paint);
      
      // Move to the next position
      startX += ellipseWidth + spacing;
    }
  }

  @override
  bool shouldRepaint(covariant DottedDivider oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.ellipseWidth != ellipseWidth ||
        oldDelegate.ellipseHeight != ellipseHeight ||
        oldDelegate.spacing != spacing;
  }
}

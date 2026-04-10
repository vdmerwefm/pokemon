part of '../presentation/page/pokemon_details_page.dart';

class DottedDividerPainter extends CustomPainter {
  DottedDividerPainter({
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
  bool shouldRepaint(covariant DottedDividerPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.ellipseWidth != ellipseWidth ||
        oldDelegate.ellipseHeight != ellipseHeight ||
        oldDelegate.spacing != spacing;
  }
}

class PokemonDivider extends StatelessWidget {
  const PokemonDivider({this.height, super.key});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 0,
      width: double.infinity,
      child: CustomPaint(
        painter: DottedDividerPainter(
          color: const Color(0xFF3A3A3A),
        ),
      ),
    );
  }
}

class PokemonDividerAlt extends StatelessWidget {
  const PokemonDividerAlt({this.height, this.padding, super.key});

  final double? height;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: padding ?? 0),
      height: height ?? 0,
      width: double.infinity,
      child: CustomPaint(
        painter: DottedDividerPainter(
          color: const Color(0xFF3A3A3A),
        ),
      ),
    );
  }
}

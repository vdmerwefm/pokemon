part of '_barrel_pokemon_details.dart';

class StatRectangleBarPainterWidget extends StatefulWidget {
  const StatRectangleBarPainterWidget({
    required this.statValue,
    required this.color,
    required this.blockSize,
    super.key,
  });

  final int statValue;
  final Color color;
  final Size blockSize;

  @override
  State<StatRectangleBarPainterWidget> createState() =>
      _StatRectangleBarPainterState();
}

///https://medium.com/@amitsingh506142/creating-stunning-animations-with-custompainter-in-flutter-60bc7f880b2b
///https://www.gameuidatabase.com/gameData.php?id=688&autoload=28632
///
///We want to create a bar of rectangles that will fill up based on statValue/255
///255 being the highest base stat available
///we will have a rating in a separate widget deeming the pokemone weak -
class _StatRectangleBarPainterState extends State<StatRectangleBarPainterWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class BarPainter extends CustomPainter {
  BarPainter({
    required this.baseColor,
    required this.fillColor,
    required this.blockWidth,
    required this.stat,
    this.custPadding,
  });

  final Color baseColor;
  final Color fillColor;
  final double blockWidth;
  final double stat;
  double? custPadding;

  @override
  void paint(Canvas canvas, Size size) {
    var padding = custPadding ?? 0;

    final count = size.width / 12;
    final statCount = ((stat / 255) * 100) * (count.ceilToDouble() / 100);
    for (var i = 0; i < statCount; i++) {
      canvas.drawPath(
        Path()
          ..addRect(Rect.fromLTWH(padding, 0, blockWidth, size.height))
          ..close(),
        Paint()
          ..color = i == statCount.floorToDouble()
              ? StatRectanglePainterUtil.getStatColor(stat)
              : const Color(0xFFE5E5E5)
          ..style = PaintingStyle.fill,
      );

      padding += 12;
    }

    for (var i = 0; i < count.ceilToDouble(); i++) {
      canvas.drawPath(
        Path()
          ..addRect(Rect.fromLTWH(padding, 0, blockWidth, size.height))
          ..close(),
        Paint()
          ..color = const Color(0xFF1A1A1A)
          ..style = PaintingStyle.fill,
      );

      padding += 12;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

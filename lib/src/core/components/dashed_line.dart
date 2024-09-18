import 'package:flutter/widgets.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({
    super.key,
    this.width = 2,
    this.direction = DashedLineDirection.horizontal,
    this.color = const Color(0xFF000000),
    this.size = 8,
    this.gap = 6,
  });

  final double width;
  final DashedLineDirection direction;
  final Color color;
  final double size;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          direction == DashedLineDirection.horizontal ? double.infinity : width,
      height:
          direction == DashedLineDirection.horizontal ? width : double.infinity,
      child: CustomPaint(
        painter: DashedLinePainter(
          width: width,
          direction: direction,
          color: color,
          size: size,
          gap: gap,
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  const DashedLinePainter({
    required this.width,
    required this.direction,
    required this.color,
    required this.size,
    required this.gap,
  });

  final double width;
  final DashedLineDirection direction;
  final Color color;
  final double size;
  final double gap;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    final Path path = Path();

    if (direction == DashedLineDirection.horizontal) {
      for (double i = 0; i < size.width; i += gap + this.size) {
        path.moveTo(i, 0);
        path.lineTo(i + this.size, 0);
      }
    } else {
      for (double i = 0; i < size.height; i += gap + this.size) {
        path.moveTo(0, i);
        path.lineTo(0, i + this.size);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

enum DashedLineDirection {
  horizontal,
  vertical,
}

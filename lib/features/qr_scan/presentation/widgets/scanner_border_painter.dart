
import 'package:flutter/material.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';

class ScannerBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 4.0;
    const cornerLength = 28.0;

    final fillPaint = Paint()
    ..color = AppColors.white.withValues(alpha: 0.1)
    ..style = PaintingStyle.fill;

    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.drawRect(rect, fillPaint);

    final borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final w = size.width;
    final h = size.height;

    final path = Path()
      ..moveTo(0, cornerLength)
      ..lineTo(0, 0)
      ..lineTo(cornerLength, 0)
      ..moveTo(w - cornerLength, 0)
      ..lineTo(w, 0)
      ..lineTo(w, cornerLength)
      ..moveTo(0, h - cornerLength)
      ..lineTo(0, h)
      ..lineTo(cornerLength, h)
      ..moveTo(w - cornerLength, h)
      ..lineTo(w, h)
      ..lineTo(w, h - cornerLength);

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(_) => false;
}
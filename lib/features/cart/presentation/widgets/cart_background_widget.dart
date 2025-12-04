import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';

class CartBackgroundWidget extends StatelessWidget {
  const CartBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _WavyBackgroundPainter(
          color: AppColors.pinkExtraLight,
          borderRadius: 17.r,
          waveHeight: 24,
          waveWidth: 46),
    );
  }
}

class _WavyBackgroundPainter extends CustomPainter {
  final Color color;
  final double borderRadius;
  final double waveHeight;
  final double waveWidth;

  _WavyBackgroundPainter({
    required this.color,
    required this.borderRadius,
    required this.waveHeight,
    required this.waveWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();

    path.moveTo(0, borderRadius);
    path.quadraticBezierTo(0, 0, borderRadius, 0);
    path.lineTo(size.width - borderRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);

    path.lineTo(size.width, size.height - waveHeight);

    double x = size.width;
    while (x > 0) {
      path.quadraticBezierTo(
        x - waveWidth / 2,
        size.height + waveHeight,
        x - waveHeight,
        size.height - waveHeight,
      );
      x -= waveWidth;
    }

    path.lineTo(0, borderRadius);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

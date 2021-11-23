import 'dart:math';

import 'package:flutter/material.dart';

import 'package:game_app_ui/config/constants.dart';

class AttributeWidget extends StatelessWidget {
  final double percent;
  final double size;
  final Widget child;

  const AttributeWidget({
    Key? key,
    required this.percent,
    this.size = 42,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AttributePainter(percent: percent),
      size: Size(size, size),
      child: Container(
        padding: EdgeInsets.all(size * 0.25),
        width: size,
        height: size,
        child: child,
      ),
    );
  }
}

class AttributePainter extends CustomPainter {
  final double percent;
  final double strokeWidth;
  final double strokeFilledWidth;
  final Paint bgPaint;
  final Paint bgStrokePaint;
  final Paint strokeFilledPaint;

  AttributePainter({
    required this.percent,
    this.strokeWidth = 2.0,
    this.strokeFilledWidth = 4.0,
  })  : bgPaint = Paint()..color = Colors.white.withOpacity(0.25),
        bgStrokePaint = Paint()..color = violetSoft,
        strokeFilledPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeFilledWidth
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawCircle(center, radius - strokeWidth, bgStrokePaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - (strokeWidth / 2)),
      -pi / 2, // -45 degree to start from top
      (percent / 100) * pi * 2,
      false,
      strokeFilledPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

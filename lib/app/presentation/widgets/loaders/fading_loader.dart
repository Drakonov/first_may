import 'dart:math' as math;

import 'package:flutter/material.dart';

class FadingLoader extends StatefulWidget {
  const FadingLoader({
    this.size = 56,
    required this.color,
    this.lapDuration = 1000,
    this.strokeWidth = 7,
    super.key,
  });

  final double size;
  final Color color;
  final int lapDuration;
  final double strokeWidth;

  @override
  _CircularProgress createState() => _CircularProgress();
}

class _CircularProgress extends State<FadingLoader> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.lapDuration),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(controller),
      child: CustomPaint(
        painter: CirclePaint(progress: controller.value, color: widget.color, strokeWidth: widget.strokeWidth),
        size: Size(widget.size, widget.size),
      ),
    );
  }
}

class CirclePaint extends CustomPainter {
  const CirclePaint({
    this.progress = 1,
    required this.color,
    this.strokeWidth = 15,
  });

  final Color color;
  final double strokeWidth;
  final double progress;

  double _degreeToRad(double degree) => degree * math.pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    double centerPoint = size.height / 2;

    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.shader = SweepGradient(
      colors: [Colors.transparent, color],
      tileMode: TileMode.repeated,
      startAngle: _degreeToRad(270),
      endAngle: _degreeToRad(270 + 360.0),
    ).createShader(
      Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0),
    );

    var scapSize = strokeWidth * 0.70;
    double scapToDegree = scapSize / centerPoint;
// 2
    double startAngle = _degreeToRad(270) + scapToDegree;
    double sweepAngle = _degreeToRad(360) - (2 * scapToDegree);

    canvas.drawArc(
        const Offset(0.0, 0.0) & Size(size.width, size.width), startAngle, sweepAngle, false, paint..color = color);
  }

  @override
  bool shouldRepaint(CirclePaint oldDelegate) {
    return true;
  }
}

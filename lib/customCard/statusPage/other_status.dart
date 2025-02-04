import 'dart:math';

import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus(
      {super.key,
      required this.imagename,
      required this.name,
      required this.subtitle,
      required this.isSeen,
      required this.statusNum});
  final String imagename;
  final String name;
  final String subtitle;
  final bool isSeen;
  final int statusNum;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: StatusPainter(isSeen: isSeen, statusNum: statusNum),
        child: CircleAvatar(
          radius: 27,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage(
            imagename,
          ),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}

degreeToAngle(double degree) {
  return degree * pi / 100;
}

class StatusPainter extends CustomPainter {
  final bool isSeen;
  final int statusNum;

  StatusPainter({super.repaint, required this.isSeen, required this.statusNum});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..color = isSeen ? Colors.grey : const Color(0xff21bfa6)
      ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);
  }

  void drawArc(Canvas canvas, Size size, Paint paint) {
    if (statusNum == 1) {
      canvas.drawArc(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        degreeToAngle(0),
        degreeToAngle(360),
        false,
        paint,
      );
    } else {
      double degree = -90;

      double arc = 360 / statusNum;
      for (var i = 0; i < statusNum; i++) {
        canvas.drawArc(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToAngle(degree + 4),
          degreeToAngle(arc - 8),
          false,
          paint,
        );
        degree += arc;
      }
    }

  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

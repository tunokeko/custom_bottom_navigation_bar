import 'package:flutter/material.dart';

class BnbBarIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback press;
  final bool? isSelected;

  const BnbBarIcon(this.icon,{super.key, required this.press, this.isSelected});

  Widget createConditionalButton() {
    if(isSelected ?? false) {
      return CustomPaint(
        painter: IconBottomPainter(),
        child: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
      );
    } else {
      return Icon(
          icon,
          color: Colors.white,
          size: 32,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: createConditionalButton(),
    );
  }
}

class IconBottomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8
    ..color = Colors.white;

    final Offset startingPoint = Offset(size.width / 2, size.height + 4);
    canvas.drawCircle(startingPoint, 0.25, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_projject/styleguide/colors.dart';
import 'package:flutter_projject/styleguide/decoration.dart';
import 'package:flutter_projject/widgets/bnb_bar_icon.dart';

class BottomCustomBar extends StatefulWidget {
  const BottomCustomBar({
    super.key, required this.icons, required this.press,
  });

  final List icons;
  final ValueChanged<num> press;

  @override
  State<BottomCustomBar> createState() => _BottomCustomBarState();
}

class _BottomCustomBarState extends State<BottomCustomBar> {
  int activeIndex = 0;

  void changeActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      height: 80,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(screenWidth, 80),
            painter: BNBCustomPainter(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(widget.icons.length + 2, (index) {
                if(index < 2 || index > 3) {
                  return index < 2 ? 
                  BnbBarIcon(
                    widget.icons[index],
                    press: () {
                      changeActiveIndex(index);
                      widget.press(index);
                    },
                    isSelected: activeIndex == index,
                  ) :
                  BnbBarIcon(
                    widget.icons[index - 2],
                    press: () {
                      changeActiveIndex(index - 2);
                      widget.press(index - 2);
                    } ,
                    isSelected: activeIndex == index - 2,  
                  );
                } else {
                  return Container();
                } 
              })
            ],
          ),
          Center(
            heightFactor: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: highlightColor,
                shape: BoxShape.circle, 
                boxShadow: shadow
              ),
              child: IconButton(
                  onPressed: () {}, icon: BnbBarIcon(Icons.add, press: () {},)),
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = highlightColor
      ..strokeWidth = 6
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(size.width * 0.36, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.6, 20),
        radius: const Radius.circular(45), clockwise: false);
    path.quadraticBezierTo(size.width * 0.64, 0, size.width * 0.70, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 80);
    path.lineTo(0, 80);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

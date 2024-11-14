import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_projject/models/hamburger.dart';

class HamburgerDetailPage extends StatefulWidget {
  final Hamburger hamburger;

  const HamburgerDetailPage({super.key, required this.hamburger});

  @override
  State<HamburgerDetailPage> createState() => _HamburgerDetailPageState();
}

class _HamburgerDetailPageState extends State<HamburgerDetailPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 500) 
    );
    _curvedAnimation = CurvedAnimation(
      parent: _controller, 
      curve: Curves.ease
    );
    
    Future.delayed(const Duration(milliseconds: 200), () {
      _controller.forward();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Center(
          child: ScaleTransition(
            scale: _curvedAnimation.drive(Tween(begin: 0, end: 1)),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(pi * 2 * _curvedAnimation.value),
              child: Image.asset(widget.hamburger.url)
            )
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_projject/styleguide/colors.dart';
import 'package:flutter_projject/styleguide/decoration.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key,required this.isSelected, required this.text});

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: isSelected ? highlightColor : Colors.black.withOpacity(0.1),
        boxShadow: isSelected ? shadow : [],
      ),
      child: Text(text, style: TextStyle(
        color: isSelected ? highlightTextColor : subtitleColor,
        fontSize: 14
      )),
    );
  }
}
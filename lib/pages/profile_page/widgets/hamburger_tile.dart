import 'package:flutter/material.dart';
import 'package:flutter_projject/models/hamburger.dart';
import 'package:flutter_projject/styleguide/colors.dart';
import 'package:flutter_projject/styleguide/decoration.dart';

class HamburgerTile extends StatelessWidget {
  const HamburgerTile({
    super.key, required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: highlightTextColor,
        boxShadow: shadow,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(hamburgers[index].url, 
            width: 100,
            height: 150,
            fit: BoxFit.fill,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hamburgers[index].title, style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'
              ),),
              Text(hamburgers[index].subtitle)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: goldenStarColor,),
                  Text(hamburgers[index].rating.toString()),
                ],
              ),
                const Icon(Icons.favorite_border_outlined)
            ],
          )
        ],
      ),                    
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_projject/models/hamburger.dart';
import 'package:flutter_projject/pages/profile_page/widgets/category_tile.dart';
import 'package:flutter_projject/pages/profile_page/widgets/hamburger_tile.dart';
import 'package:flutter_projject/styleguide/colors.dart';
import 'package:flutter_projject/styleguide/decoration.dart';
import 'package:flutter_projject/styleguide/fonts.dart';
import 'package:flutter_projject/widgets/buttom_custom_bar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final List texts = ['All','Combos','Sliders','Classic'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Foodgo", style: appTitle),
                      Text("Order Your Favourite Food!", style: subtitle),
                    ],
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: highlightTextColor,
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        boxShadow: shadow
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(vertical: 12)
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: highlightColor,
                      borderRadius: BorderRadius.all(radius)
                    ),
                    child: const Icon(Icons.settings, color: highlightTextColor,),
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(texts.length, (index) {
                      return CategoryTile(
                        isSelected: index == 0, 
                        text: texts[index]
                      );
                    })
                  ],
                ),
              ),
              GridView.builder(
                
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.68,
                ),
                itemCount: hamburgers.length, 
                itemBuilder: (context, index) {
                  return HamburgerTile(index: index);
                }
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomCustomBar(
        icons: const [
          Icons.home_outlined,
          Icons.person_outline_outlined,
          Icons.message_outlined,
          Icons.favorite
        ],
        press: (index) => {},
      ),
    );
  }
}

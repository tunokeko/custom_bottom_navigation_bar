import 'package:flutter/material.dart';
import 'package:flutter_projject/pages/profile_page/widgets/InputField.dart';
import 'package:flutter_projject/styleguide/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: highlightColor.withOpacity(0.1),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              'assets/images/hamburger-1.png',
              color: highlightColor,
              colorBlendMode: BlendMode.multiply,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            bottom: 0,
            height: screenHeight * 0.75,
            width: screenWidth,            
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                16, 128, 16, 8
              ),
              decoration: const BoxDecoration(
                color: highlightTextColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ) 
              ),
              child: Column(
                children: [
                  const InputField(),
                  const SizedBox(height: 24),
                  const InputField.email(),
                  const SizedBox(height: 24),
                  const InputField(
                    label: "Delivery Address",
                    leftIcon: Icon(Icons.fast_forward),
                  ),
                  const SizedBox(height: 24),
                  const InputField.password(),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  const Column(
                    children: [
                      Row(
                        children: [
                          Text("Payment Details"),
                          Spacer(),
                          Icon(Icons.arrow_right)
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Text("Order History"),
                          Spacer(),
                          Icon(Icons.arrow_right)
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: subtitleColor
                        ),
                        child: const Row(
                          children: [
                            Text("Edit Profile",style: TextStyle(color: Colors.white),),
                            SizedBox(width: 8,),
                            Icon(Icons.update, color: Colors.white,)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: highlightColor
                        ),
                        child: const Row(
                          children: [
                            Text("Log Out",style: TextStyle(color: highlightTextColor),),
                            SizedBox(width: 8,),
                            Icon(Icons.logout, color: Colors.white,)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: (screenHeight * 0.25) - (screenWidth / 5),
            left: (screenWidth / 2) - (screenWidth / 5),
            width: screenWidth / 2.5,
            height: screenWidth / 2.5,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: highlightColor, width: 5),
                borderRadius: const BorderRadius.all(Radius.circular(24))
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                child: Image.asset(
                  'assets/images/profile.jpg',
                  fit: BoxFit.fitWidth,
                ),
              
              ),
            ),
          )
        ],
      ),
    );
  }
}

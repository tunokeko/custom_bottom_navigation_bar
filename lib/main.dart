import 'package:flutter/material.dart';
import 'package:flutter_projject/pages/profile_page/profile_page.dart';
//En üstte genel şeylet(ortalama gibi)
//ortada seçilecek dersler
//en altta o ders ile ilgili sonuçlar
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}
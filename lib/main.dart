import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(const PetCatalogApp());
}

class PetCatalogApp extends StatelessWidget {
  const PetCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Catalog',
      theme: ThemeData(
        primaryColor: const Color(0xFFFF9934),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF9934)),
        fontFamily: "Poppins",
        useMaterial3: true,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

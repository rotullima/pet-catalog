import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../widgets/pet_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Pet> pets = [
    Pet(name: "Grange", type: "Cat", image: "assets/images/cat.jpg"),
    Pet(name: "Mapoy", type: "Dog", image: "assets/images/dog.jpg"),
    Pet(name: "Cepi", type: "Capybara", image: "assets/images/capybara.jpg"),
    Pet(name: "Milty", type: "Cow", image: "assets/images/cow.jpg"),
    Pet(name: "Toothless", type: "Dragon", image: "assets/images/dragon.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pet Catalog",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFF9934), // warm orange
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // grid 2 kolom
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3/4,
          ),
          itemCount: pets.length,
          itemBuilder: (context, index) {
            return PetCard(
              pet: pets[index],
              onTap: () {
                // sementara kosong (commit 1)
                // nanti commit 2 masuk ke detail page
              },
            );
          },
        ),
      ),
    );
  }
}

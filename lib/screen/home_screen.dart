import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../widgets/pet_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Pet> pets = [
    Pet(
      name: "Grange",
      type: "Cat",
      image: "assets/images/cat.jpg",
      character: "Manja, suka tidur di sofa",
      care: "Kasih makan 2x sehari dan sediakan tempat tidur hangat",
    ),
    Pet(
      name: "Mapoy",
      type: "Dog",
      image: "assets/images/dog.jpg",
      character: "Setia, suka diajak jalan-jalan",
      care: "Ajak olahraga rutin, beri vaksin, dan kasih tulang mainan",
    ),
    Pet(
      name: "Cepi",
      type: "Capybara",
      image: "assets/images/capybara.jpg",
      character: "Tenang, suka berendam di air",
      care: "Sediakan kolam kecil dan beri sayuran segar setiap hari",
    ),
    Pet(
      name: "Milty",
      type: "Cow",
      image: "assets/images/cow.jpg",
      character: "Sabar, jinak, suka makan rumput",
      care: "Kasih rumput segar, jaga kebersihan kandang",
    ),
    Pet(
      name: "Toothless",
      type: "Dragon",
      image: "assets/images/dragon.png",
      character: "Kuat, bisa terbang, setia dengan pemilik",
      care: "Butuh ruang luas, kasih ikan bakar, jangan lupa ajak terbang sore",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pet Catalog",
          style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold),
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
            childAspectRatio: 1,
          ),
          itemCount: pets.length,
          itemBuilder: (context, index) {
            return PetCard(
              pet: pets[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(pet: pets[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

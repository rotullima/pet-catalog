import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../widgets/pet_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Pet> pets = [
    Pet(
      name: "Grange",
      type: "Cat",
      image: "assets/images/cat.jpg",
      character: "Affectionate, loves sleeping on the sofa",
      care: "Feed twice a day and provide a warm bed",
    ),
    Pet(
      name: "Mapoy",
      type: "Dog",
      image: "assets/images/dog.jpg",
      character: "Loyal, loves going for walks",
      care: "Take on regular walks, give vaccines, and provide chew toys",
    ),
    Pet(
      name: "Cepi",
      type: "Capybara",
      image: "assets/images/capybara.jpg",
      character: "Calm, enjoys soaking in water",
      care: "Provide a small pool and fresh vegetables daily",
    ),
    Pet(
      name: "Milty",
      type: "Cow",
      image: "assets/images/cow.jpg",
      character: "Gentle, tame, loves eating grass",
      care: "Give fresh grass and keep the barn clean",
    ),
    Pet(
      name: "Toothless",
      type: "Dragon",
      image: "assets/images/dragon.png",
      character: "Strong, can fly, loyal to its owner",
      care: "Needs a large space, feed fresh fish, and take evening flights",
    ),
  ];

  List<Pet> filteredPets = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredPets = pets; // awalnya semua tampil
  }

  void _filterPets(String query) {
    final results = pets.where((pet) {
      return pet.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredPets = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Text(
            "Pet Catalog",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFFFF9934),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          elevation: 4,
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: searchController,
              onChanged: _filterPets,
              decoration: InputDecoration(
                hintText: "Find a pet...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color.fromARGB(
                  255,
                  247,
                  218,
                  196,
                ), // light gray
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Grid daftar hewan
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: filteredPets.isEmpty
                  ? const Center(
                      child: Text(
                        "Pets not found 🐾",
                        style: TextStyle(fontFamily: "Poppins"),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1,
                          ),
                      itemCount: filteredPets.length,
                      itemBuilder: (context, index) {
                        return PetCard(
                          pet: filteredPets[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(pet: filteredPets[index]),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

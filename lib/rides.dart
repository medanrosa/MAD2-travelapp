// Hotels Page
import 'package:flutter/material.dart';

class HotelsPage extends StatelessWidget {
  final List<Map<String, dynamic>> landmarks = [
    {
      'name': 'Tuk Tuk Rental Negombo',
      'image': 'assets/rental1.jpg',
      'description': 'The port\'s vibrant atmosphere, characterized by colorful boats and bustling activity, offers visitors a glimpse into the traditional way of life in this coastal town.',
    },
    {
      'name': 'Shenaly Rent a Car',
      'image': 'assets/rental2.jpg',
      'description': 'A historic landmark nestled in the heart of the city. With its impressive architecture and serene surroundings, the church stands as a symbol of faith and community in Negombo.',
    },
    {
      'name': 'Sri Lanks Bike Rent.com',
      'image': 'assets/rental3.jpg',
      'description': 'As a symbol of navigation and safety, the Negombo lighthouse offers stunning views and serves as a reminder of the city\'s maritime heritage.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Rides"),
      ),
      body: ListView.builder(
        itemCount: landmarks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                // Navigate to the details page of the landmark
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.asset(
                        landmarks[index]['image'],
                        fit: BoxFit.cover,
                        height: 200, // Adjust height as needed
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        landmarks[index]['name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        landmarks[index]['description'],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
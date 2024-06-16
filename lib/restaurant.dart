import 'package:flutter/material.dart';

class RestaurantsPage extends StatefulWidget {
  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Avenra Bayfont',
      'image': 'assets/bayfont.jpg',
      'description': 'The port\'s vibrant atmosphere, characterized by colorful boats and bustling activity, offers visitors a glimpse into the traditional way of life in this coastal town.',
    },
    {
      'name': 'Regal Reseau',
      'image': 'assets/regal.jpg',
      'description': 'A historic landmark nestled in the heart of the city. With its impressive architecture and serene surroundings, the church stands as a symbol of faith and community in Negombo.',
    },
    {
      'name': 'Tuk Tuk Wine & Dine',
      'image': 'assets/tuktuk.jpg',
      'description': 'As a symbol of navigation and safety, the Negombo lighthouse offers stunning views and serves as a reminder of the city\'s maritime heritage.',
    },
    {
      'name': 'Lagoon Deck',
      'image': 'assets/lagoondeck.jpg',
      'description': 'Situated in the heart of Negombo, the fort serves as a reminder of the strategic importance during colonial times.',
    },
  ];

  final List<Map<String, dynamic>> bookmarkedRestaurants = [];

  void toggleBookmark(Map<String, dynamic> restaurant) {
    setState(() {
      if (bookmarkedRestaurants.contains(restaurant)) {
        bookmarkedRestaurants.remove(restaurant);
      } else {
        bookmarkedRestaurants.add(restaurant);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Restaurants"),
      ),
      body: Column(
        children: [
          if (bookmarkedRestaurants.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bookmarked Restaurants',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bookmarkedRestaurants.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150, // Set a fixed width for each bookmark item
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    bookmarkedRestaurants[index]['image'],
                                    width: 150,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  bookmarkedRestaurants[index]['name'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                IconButton(
                                  icon: Icon(Icons.bookmark_remove),
                                  onPressed: () {
                                    toggleBookmark(bookmarkedRestaurants[index]);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      // Navigate to the details page of the restaurant
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
                              restaurants[index]['image'],
                              fit: BoxFit.cover,
                              height: 250, // Adjust height as needed
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  restaurants[index]['name'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    bookmarkedRestaurants.contains(restaurants[index])
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                  ),
                                  onPressed: () {
                                    toggleBookmark(restaurants[index]);
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              restaurants[index]['description'],
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
          ),
        ],
      ),
    );
  }
}

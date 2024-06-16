import 'package:flutter/material.dart';

class LandmarksPage extends StatefulWidget {
  @override
  _LandmarksPageState createState() => _LandmarksPageState();
}

class _LandmarksPageState extends State<LandmarksPage> {
  final List<Map<String, dynamic>> landmarks = [
    {
      'name': 'Fishing Port',
      'image': 'assets/fishingport.jpg',
      'description': 'The port\'s vibrant atmosphere, characterized by colorful boats and bustling activity, offers visitors a glimpse into the traditional way of life in this coastal town.',
    },
    {
      'name': 'Grand Street Church',
      'image': 'assets/chruch.jpg',
      'description': 'A historic landmark nestled in the heart of the city. With its impressive architecture and serene surroundings, the church stands as a symbol of faith and community in Negombo.',
    },
    {
      'name': 'Negombo Lighthouse',
      'image': 'assets/neglighthouse.jpg',
      'description': 'As a symbol of navigation and safety, the Negombo lighthouse offers stunning views and serves as a reminder of the city\'s maritime heritage.',
    },
    {
      'name': 'Dutch Fort',
      'image': 'assets/dutchFort.jpg',
      'description': 'Situated in the heart of Negombo, the fort serves as a reminder of the strategic importance during colonial times.',
    },
  ];

  final List<Map<String, dynamic>> bookmarkedLandmarks = [];

  void toggleBookmark(Map<String, dynamic> landmark) {
    setState(() {
      if (bookmarkedLandmarks.contains(landmark)) {
        bookmarkedLandmarks.remove(landmark);
      } else {
        bookmarkedLandmarks.add(landmark);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Landmarks"),
      ),
      body: Column(
        children: [
          if (bookmarkedLandmarks.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bookmarked Landmarks',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bookmarkedLandmarks.length,
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
                                    bookmarkedLandmarks[index]['image'],
                                    width: 150,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  bookmarkedLandmarks[index]['name'],
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
                                    toggleBookmark(bookmarkedLandmarks[index]);
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  landmarks[index]['name'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    bookmarkedLandmarks.contains(landmarks[index])
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                  ),
                                  onPressed: () {
                                    toggleBookmark(landmarks[index]);
                                  },
                                ),
                              ],
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
          ),
        ],
      ),
    );
  }
}
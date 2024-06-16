import 'package:flutter/material.dart';
import 'package:negombo/components/compass.dart';
import 'package:negombo/components/weatherpg.dart';
import 'package:negombo/horseride.dart';
import 'package:negombo/lighthouse.dart';
import 'package:negombo/restaurant.dart';
import 'package:negombo/snorkeling.dart';
import 'package:negombo/spaday.dart';

import 'Logins/auth.dart';
import 'Logins/login.dart';
import 'atvrides.dart';
import 'rides.dart';
import 'jetski.dart';
import 'landmark.dart';
import 'settings.dart';

class HomePage extends StatelessWidget {
  final _auth = AuthService();

  void goToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/homeimage.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Welcome to Negombo",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LandmarksPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Landmarks",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantsPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Restaurants",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HotelsPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Rides",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "Activities",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActivityBanner(
                      image: 'assets/jetskipg.jpg',
                      text: "Jet Skies",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => JetSki()));
                      },
                    ),
                    ActivityBanner(
                      image: 'assets/ATVrides.jpg',
                      text: "ATV Rides",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ATVRide()));
                      },
                    ),
                    ActivityBanner(
                      image: 'assets/spaday.jpg',
                      text: "Spa Day",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SpaDay()));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActivityBanner(
                      image: 'assets/lighthouse.jpg',
                      text: "Lighthouse Visit",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Lighthouse()));
                      },
                    ),
                    ActivityBanner(
                      image: 'assets/horseriding1.jpg',
                      text: "Horse Riding",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HorseRide()));
                      },
                    ),
                    ActivityBanner(
                      image: 'assets/snorkling1.jpg',
                      text: "Snorkeling",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Snorkeling()));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 5),
                // Add the Go to Compass button here with an icon
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey.withOpacity(0.6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () async {
                await _auth.signout();
                goToLogin(context);
              },
              child: Icon(Icons.exit_to_app),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Compassage()));
              },
              child: Icon(Icons.explore),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherPage()));
              },
              child: Icon(Icons.cloud),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              child: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityBanner extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;

  ActivityBanner({required this.image, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 125,
        height: 220,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  final String activity;

  InfoPage(this.activity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity),
      ),
      body: Center(
        child: Text(
          "Details about $activity",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

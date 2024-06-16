import 'package:flutter/material.dart';

class ATVRide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ATV Ride'),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ATVrides.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ATV ride Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Here you can find detailed information about ATV rides.',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 30),

            Column(
              children: [
                // Banner 1
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'ATV rides are popular in the beach areas of the negombo and few of them are located towards the minuwangoda area where you can find trails',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Image.asset(
                          'assets/ATVwiget1.jpg',
                          width: 300,
                          height: 150),
                      SizedBox(height: 30),
                      Image.asset(
                          'assets/ATVwiget2.jpg',
                          width: 300,
                          height: 170)
                    ],
                  ),
                ),
              ],
            ),
          ],
          ),
          ),
        ],
      ),
    );
  }
}

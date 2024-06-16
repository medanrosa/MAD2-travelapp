import 'package:flutter/material.dart';

class SpaDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spa Day'),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/spaday.jpg'),
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
                  'Spa & Skin care center Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'In the City of Negombo, Spa and skin care centers can be seen everywhare. \n\nHowever, our recomendation is to use the inhouse hotel spa facilities or find some trusted local to show their favourite spot to spend their spa day',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
            SizedBox(height: 20),

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
                        'Jetwing Hotels',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Jetwing Hotels provides top notch spa services at their negombo branches',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset(
                          'assets/spadaywiget.jpg',
                          width: 300,
                          height: 240),
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

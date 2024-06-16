import 'package:flutter/material.dart';

class JetSki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/jetskipg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Jet Ski'),
          backgroundColor: Colors.white, // Make app bar transparent
          elevation: 0, // Remove app bar elevation
        ),
        backgroundColor: Colors.transparent, // Make Scaffold background transparent
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jet Ski Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Here you can find detailed information about Jet Skis.',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
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
                            'Package 1',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Rent out 1 mid powered jet ski for 24 hours',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          Image.asset(
                            'assets/jetwiget2.jpg',
                            width: 300,
                            height: 150,
                          )
                        ],
                      ),
                    ),
                    // Banner 2
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
                            'Package 2',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Rent out 2 high powered jet skis for 24 hours',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          Image.asset(
                            'assets/jetwiget1.jpg',
                            width: 300,
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Compassage extends StatefulWidget {
  const Compassage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Compassage> {
  MagnetometerEvent _magneticEvent = MagnetometerEvent(0, 0, 0);
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    subscription = magnetometerEvents.listen((event) {
      setState(() {
        _magneticEvent = event;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  double calculateDegrees(double x, double y) {
    double heading = atan2(x, y);
    // Convert from radians to degrees
    heading = heading * 180 / pi;
    // Ensure that the heading is between 0 and 360 degrees

    if (heading > 0) {
      heading -= 360;
    }
    return heading * -1;
  }

  @override
  Widget build(BuildContext context) {
    final degrees = calculateDegrees(_magneticEvent.x, _magneticEvent.y);
    final angle = -1 * pi / 180 * degrees;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Compass'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${degrees.toStringAsFixed(0)} °'),
            Expanded(
              child: Center(
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset(
                    'assets/compass.png',
                    height: MediaQuery.of(context).size.height * 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

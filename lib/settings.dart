import 'package:flutter/material.dart';
import 'package:negombo/Themes/theme_provider.dart';
import 'package:negombo/components/button.dart';
import 'package:provider/provider.dart';
import 'package:battery_plus/battery_plus.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Battery _battery = Battery();
  int _batteryLevel = 100;
  BatteryState _batteryState = BatteryState.full;

  @override
  void initState() {
    super.initState();
    _initBattery();
  }

  Future<void> _initBattery() async {
    final int batteryLevel = await _battery.batteryLevel;
    final BatteryState batteryState = await _battery.batteryState;
    setState(() {
      _batteryLevel = batteryLevel;
      _batteryState = batteryState;
    });

    _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        _batteryState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary, // Button color
                onPrimary: Colors.white, // Text color
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                textStyle: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
              child: Text('Dark Mode'),
            ),
            SizedBox(height: 20),
            Text(
              'Battery Status',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            SizedBox(height: 10),
            _buildBatteryStatusBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildBatteryStatusBar() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Stack(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 44) * (_batteryLevel / 100), // Adjusting for padding
            height: 40,
            decoration: BoxDecoration(
              color: _batteryLevel > 20 ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Center(
            child: Text(
              '$_batteryLevel%',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/calculation_screen.dart';
import 'package:flutter_application_3/screens/configuration_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 10;
  @override
  Widget build(BuildContext context) {
    const fontStyle = TextStyle(fontSize: 30);
    const fontColor = TextStyle(color: Colors.white);

    return Scaffold(
        backgroundColor: Colors.purple[400],
        appBar: AppBar(
          title: const Text("Home"),
          elevation: 0,
          backgroundColor: Colors.purple,
        ),
        body: Drawer(
          backgroundColor: Colors.purple[300],
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                ),
                child: const Text('Menu'),
              ),
              ListTile(
                title: const Text(
                  'Tips',
                  style: fontColor,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalculationScreen(0)));
                },
              ),
              ListTile(
                title: const Text(
                  'Configuration',
                  style: fontColor,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConfigurationScreen()));
                },
              ),
            ],
          ),
        ));
  }
}

import "package:flutter/material.dart";

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Weather App",
          style: TextStyle(
            color: Colors.white),
          ),
        )
      ),
    );
  }
}
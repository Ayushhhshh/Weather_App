import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather App", style: TextStyle(fontWeight:FontWeight.bold)),),
    );
  }
}
//                         13:24:22
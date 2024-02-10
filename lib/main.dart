import "package:flutter/material.dart";
import "package:weather/weathwe_page.dart";

void main(){
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: const WeatherScreen()
    );
  }
}
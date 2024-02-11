import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Weather App",
                style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
            actions: [
          IconButton(
            onPressed: () {}, icon: const Icon(Icons.refresh)
        )]
     ),
     body: const Column(
      children: [Padding(
        padding: EdgeInsets.all(8.0),
        child: Placeholder(
          fallbackHeight: 240, 
        ),
      ),
      SizedBox(height: 30,),
      Text("Weather Forecast", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20,),),
       Placeholder(
        fallbackHeight: 150, 
      )
      ],  
     ),
    );
  }
}
//                         13:24:22
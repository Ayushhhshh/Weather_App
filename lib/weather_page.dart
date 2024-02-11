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
     body:const Padding(
       padding: EdgeInsets.all(16.0),
       child: Column(
        children: [
          SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
            shadowColor: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column( 
                children:[Text("300°K", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                SizedBox(height: 16,), Icon(Icons.cloud, size: 64,),SizedBox(height: 16,), Text("Rain",style: TextStyle(fontSize: 20),)], 
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
       
       //                                      Weather Forecast Cards
       
        Text("Weather Forecast", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
       
       //                                      Additional Info Card
       
         Placeholder(
          fallbackHeight: 150, 
        ),SizedBox(height: 15,),
        Text("Additional Information", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
         Placeholder(
          fallbackHeight: 150, 
        )],  
       ),
     ),
    );
  }
}
//                                          13:24:22
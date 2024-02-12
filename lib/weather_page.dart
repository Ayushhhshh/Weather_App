import 'dart:ui';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

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
     body:ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
       child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
         child: const Padding(
           padding: EdgeInsets.all(16.0),
           child: Column(
            children: [
              SizedBox(
              width: double.infinity,
              child: Card(
                elevation:1,
                shadowColor: Colors.grey ,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column( 
                    children:[Text("300°K", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                    SizedBox(height: 16,), Icon(Icons.cloud, size: 64,),SizedBox(height: 16,), Text("Rain",style: TextStyle(fontSize: 20),)], 
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
           
           //                                      Weather Forecast Cards
           
            Align(alignment:Alignment.centerLeft,
             child: Text("Weather Forecast", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,),)),
           SizedBox(height: 17,),
           Row(
            children: [
              SizedBox(
                width: 100,
                child: Card(
                  elevation: 1,
                  shadowColor: Colors.grey ,
                  child: Padding(
                    padding: EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        Text("09:00",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(height: 8,),
                        Icon(Icons.cloud),
                        SizedBox(height: 8,),
                        Text("320.16 ")
                      ],
                    ),
                  ),
                ),
              )
            ]
           ),
           //                                      Additional Info Card
            SizedBox(height: 20,),
             Placeholder(
              fallbackHeight: 150, 
            )],  
           ),
         ),
       ),
     ),
    );
  }
}
//                                          13:59:35
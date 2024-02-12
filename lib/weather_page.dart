import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather/additional_info.dart';
import 'package:weather/hourly_forecast.dart';

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
      borderRadius:  const BorderRadius.all(Radius.circular(15)),
       child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
         child:  const Padding(
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
           SizedBox(height: 16,),
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
             child: Row(
              children: [
             HourlyForecast(
              time: "09:00",
              icon: Icons.cloud,
              temp: "320.16",
             ),
                HourlyForecast(
                   time: "12:00",
              icon: Icons.cloud,
              temp: "320.16",
                ),
                HourlyForecast(
                   time: "15:00",
              icon: Icons.cloud,
              temp: "320.16",
                ),
                HourlyForecast(
                   time: "18:00",
              icon: Icons.cloud,
              temp: "320.16",
                ),
                HourlyForecast(
                   time: "21:00",
              icon: Icons.cloud,
              temp: "320.16",
                )
              ]
             ),
           ),
           //                                      Additional Info Card
            SizedBox(height: 20,),
            Align(alignment: Alignment.centerLeft,
              child: Text("Additional Information",
              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, 
               children: [
                 AdditionalInfo(
                  icon: Icons.cloud,
                  label: "Humidity",
                  value: "94",
                 ),
                 AdditionalInfo(
                   icon: Icons.air,
                  label: "Wind Speed",
                  value: "7.67",
                 ),
                 AdditionalInfo(
                   icon: Icons.beach_access,
                  label: "Pressure",
                  value: "1000",
                 ),
               ],
             )],  
           ),
         ),
       ),
     ),
   );
  }
}


//                                          14:32:15
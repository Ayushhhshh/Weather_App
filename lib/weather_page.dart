import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather/additional_info.dart';
import 'package:weather/hourly_forecast.dart';
import 'package:http/http.dart' as http;
import 'package:weather/secret.dart';


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

//                                                      API

  Future<Map<String,dynamic>> getCurrentWeather() async{
    try {
      String cityName = 'London';
    final res = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$weatherApiKey')
    );

      final data  = jsonDecode(res.body);

      if (data['cod'] !=  '200') { 
        throw 'An unexpected error occured'; 
      }

      return data;

      // data ['list'][0]['main']['temp'];
      } catch (e) { 
        throw e.toString();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Weather App",
                style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
            actions: [
          IconButton(
            onPressed: () {
            }, icon: const Icon(Icons.refresh)
        )] 
     ),
     
     body: FutureBuilder(
      future: getCurrentWeather(),
       builder: (context , snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator.adaptive());
        }
        if (snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()));
        }

        final data = snapshot.data!;

         return ClipRRect(
        borderRadius:  const BorderRadius.all(Radius.circular(15)),
         child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
           child:   Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
              children: [
                SizedBox(
                width: double.infinity,
                child: Card(
                  elevation:1,
                  shadowColor: Colors.grey ,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column( 
                      children:[Text(' 200 K', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 16,), const Icon(Icons.cloud, size: 64,),const SizedBox(height: 16,), const Text("Rain",style: TextStyle(fontSize: 20),)], 
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
             
             //                                      Weather Forecast Cards
             
              const Align(alignment:Alignment.centerLeft,
               child: Text("Weather Forecast", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,),)),
             const SizedBox(height: 16,),
             const SingleChildScrollView(
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
                temp: "325.52",
                  ),
                  HourlyForecast(
                     time: "15:00",
                icon: Icons.sunny,
                temp: "340.06",
                  ),
                  HourlyForecast(
                     time: "18:00",
                icon: Icons.cloud,
                temp: "333.22",
                  ),
                  HourlyForecast(
                     time: "21:00",
                icon: Icons.nights_stay,
                temp: "312.23",
                  )
                ]
               ),
             ),
             //                                      Additional Info Card
              const SizedBox(height: 20,),
              const Align(alignment: Alignment.centerLeft,
                child: Text("Additional Information",
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height:20),
              const Row(
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
       );
       },
     ),
   );
  }
}
//                                          15:15:50
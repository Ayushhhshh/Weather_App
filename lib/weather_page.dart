import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      String cityName = 'Jaipur';
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
              setState(() {
              });
            }, icon: const Icon(Icons.refresh)
        )] 
     ),
     
     body: FutureBuilder(
      future: getCurrentWeather(),
       builder: (context , snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()));
        }

        final data = snapshot.data!;

        final currentWeatherData = data['list'][0];

        final currentTemp = currentWeatherData['main']['temp'];
        final currentSky = currentWeatherData ['weather'][0]['main'];
        final pressure = currentWeatherData ['main'] ['pressure'];
        final humidity = currentWeatherData ['main'] ['humidity'];
        final windSpeed = currentWeatherData ['wind']['speed'];
        final celcius1  = (currentTemp - 273.15).toStringAsFixed(2);

         return ClipRRect(
        borderRadius:  const BorderRadius.all(Radius.circular(15)),
         child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
           child:    Padding(
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
                      children:[Text('$celcius1°C', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 16,),  Icon(currentSky == 'Clouds' || currentSky == 'Rain' ? Icons.cloud : Icons.sunny, size: 64,),const SizedBox(height: 16,), Text("$currentSky",style: const TextStyle(fontSize: 20),)], 
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
             
             //                                      Weather Forecast Cards
             
              const Align(alignment:Alignment.centerLeft,
               child: Text("Hourly Forecast", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,),)),
              const SizedBox(height : 16),
                SizedBox(
                  height  :125,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index) {
                    final hourlyForecast =  data ['list'] [index + 1];
                    final hourlySky = hourlyForecast ['weather'][0]['main'];
                    final time = DateTime.parse(hourlyForecast['dt_txt']);
                    final tempKelvin = hourlyForecast['main']['temp'] as double;
                    final tempCelsius = (tempKelvin - 273.15).toStringAsFixed(2);
                    return HourlyForecast(
                      time: DateFormat.j().format(time),
                      icon: hourlySky == 'Clouds' || hourlySky == 'Rain' ? Icons.cloud : Icons.sunny,
                      temp: '$tempCelsius°C',
                        );
                  },
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
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                 children: [
                   AdditionalInfo(
                    icon: Icons.cloud,
                    label: "Humidity",
                    value: '$humidity%'.toString(),
                   ),
                   AdditionalInfo(
                     icon: Icons.air,
                    label: "Wind Speed",
                    value: '$windSpeed km/hr'.toString(),
                   ),
                   AdditionalInfo(
                     icon: Icons.beach_access,
                    label: "Pressure",
                    value: pressure.toString(),
                   ),
                 ],
               )],  
             ),
           ),
         ),
       );
       },
     ),
      bottomNavigationBar: BottomAppBar(
        height: 65,
        child: Center(child: Text("Made by Ayush Jain 🚀", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),),  
   );
  }
}
//                                              16:05:00
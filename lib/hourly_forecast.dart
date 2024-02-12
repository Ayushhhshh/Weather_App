import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
                  elevation: 1,
                  shadowColor: Colors.grey ,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(15.0),
                    child: const Column(
                      children: [
                        Text("09:00",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(height: 8,),
                        Icon(Icons.cloud),
                        SizedBox(height: 9,),
                        Text("320.16 ")
                      ],
                    ),
                  ),
                );
  }
}
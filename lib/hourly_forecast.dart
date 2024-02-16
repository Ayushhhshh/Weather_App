import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  final String time ;
  final IconData icon ;
  final String temp;
  const HourlyForecast({super.key, required this.time, required this.icon, required this.temp});
  

  @override
  Widget build(BuildContext context) {
    return Card(
                  elevation: 1,
                  shadowColor: Colors.grey ,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(15.0),
                    child:  Column(
                      children: [
                        Text(time,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), maxLines: 1,overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 8,),
                        Icon(icon),
                        const SizedBox(height: 11,),
                        Text(temp)
                       ],
                    ),
                  ),
                );
  }
}
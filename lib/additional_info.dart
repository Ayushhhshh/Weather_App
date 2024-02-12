import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
     children: [
       Icon(Icons.water_drop),
       SizedBox(height: 12),
       Text("Humidity"),
       SizedBox(height: 12),
       Text("91", style: TextStyle(fontWeight: FontWeight.bold),)
    
     ],
    );
  }
}
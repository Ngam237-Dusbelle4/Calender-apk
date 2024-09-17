// widgets/weather_widget.dart
import 'package:animeop/widgets/weather_item.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WeatherItem(icon: Icons.wb_sunny, label: 'Sunny'),
          WeatherItem(icon: Icons.water_drop, label: '65% Rain'),
          WeatherItem(icon: Icons.air, label: '8 km/h Wind'),
          WeatherItem(icon: Icons.cloud, label: '25% Storm'),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'pages/weather_page.dart';

void main() {
  runApp(const WeatherAPP());
}

class WeatherAPP extends StatelessWidget {
  const WeatherAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}

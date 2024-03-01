import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '/models/weather_models.dart';
import '/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WeatherPage> {
  final _weatherService = WeatherService("8a6fb72d300f606ca24bec8176dd67e3");

  Weather? _weather;

  _fetchWeather() async {
    // get the current city
    String cityName = await _weatherService.getCurrentCity();

    // get the weather for the city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // init state
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(10, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _weather?.cityName ?? "Loading city....",
                style: const TextStyle(color: Colors.white, fontSize: 21),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Lottie.asset("assets/cloud.json"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${_weather?.temperature.round()}°C',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${_weather?.mainCondition}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}

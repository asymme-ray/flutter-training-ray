import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String weatherCondition = 'default';
  void weather() {
    final yumemiWeather = YumemiWeather();
    final newWeatherCondition = yumemiWeather.fetchSimpleWeather();
    setState(() {
      weatherCondition = newWeatherCondition;
    });
  }

  String _getWeatherIcon(String condition) {
    switch (condition) {
      case 'sunny':
        return 'lib/assets/sunny.svg';
      case 'cloudy':
        return 'lib/assets/cloudy.svg';
      case 'rainy':
        return 'lib/assets/rainy.svg';
      default:
        return 'default';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    Widget weatherIcon;
    if (weatherCondition == 'default') {
      weatherIcon = const Placeholder();
    } else {
      weatherIcon = SvgPicture.asset(
        _getWeatherIcon(weatherCondition),
        // fit: BoxFit.contain,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Container()),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: screenSize.width / 2,
                  height: screenSize.width / 2,
                  child: weatherIcon,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: SizedBox(
                        width: screenSize.width / 4,
                        child: const Text(
                          '** ℃',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: SizedBox(
                        width: screenSize.width / 4,
                        child: const Text(
                          '** ℃',
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenSize.width / 4,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Close'),
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width / 4,
                        child: TextButton(
                          onPressed: () {
                            weather();
                          },
                          child: const Text('Reload'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

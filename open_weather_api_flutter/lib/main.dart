import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/src/features/weather_page/weather_page.dart';

void main() {
  runApp(const ProviderScope(child: WeatherApp()));
}

/// App widget top of all widget
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyleWithShadow = TextStyle(color: Colors.white, shadows: [
      BoxShadow(
        color: Colors.black12.withOpacity(0.25),
        spreadRadius: 1,
        blurRadius: 4,
        offset: const Offset(0, 0.5),
      )
    ]);
    return MaterialApp(
      title: 'Open Weather Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline1: textStyleWithShadow,
          headline2: textStyleWithShadow,
          headline3: textStyleWithShadow,
          headline4: textStyleWithShadow,
          headline5: textStyleWithShadow,
          subtitle1: const TextStyle(color: Colors.white),
          bodyText2: const TextStyle(color: Colors.white),
          bodyText1: const TextStyle(color: Colors.white),
          caption: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ),
      home: const LandingPage(),
    );
  }
}

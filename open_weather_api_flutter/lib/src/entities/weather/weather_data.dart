import 'package:open_weather/src/entities/temperature.dart';
import 'package:open_weather/src/entities/weather/weather.dart';

/// Derived model class used in the UI
class WeatherData {
  WeatherData(
      {required this.temp,
      required this.feelLike,
      required this.minTemp,
      required this.maxTemp,
      required this.main,
      required this.description,
      required this.date,
      required this.icon,
      required this.name,
      required this.lat,
      required this.lng,
      this.isPast = false});

  factory WeatherData.from(Weather weather) {
    return WeatherData(
        temp: Temperature.celsius(weather.weatherParams.temp),
        feelLike: Temperature.celsius(weather.weatherParams.feelLike),
        minTemp: Temperature.celsius(weather.weatherParams.tempMin),
        maxTemp: Temperature.celsius(weather.weatherParams.tempMax),
        main: weather.weatherInfo[0].main,
        description: weather.weatherInfo[0].description,
        date: DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
        icon: weather.weatherInfo[0].icon,
        lat: 0.0,
        lng: 0.0,
        name: weather.name ?? "",
        isPast: false);
  }

  factory WeatherData.position(WeatherPosition weather) {
    return WeatherData(
        temp: Temperature.celsius(weather.weatherParams.temp),
        feelLike: Temperature.celsius(weather.weatherParams.feelLike),
        minTemp: Temperature.celsius(weather.weatherParams.tempMin),
        maxTemp: Temperature.celsius(weather.weatherParams.tempMax),
        main: weather.weatherInfo[0].main,
        description: weather.weatherInfo[0].description,
        date: DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
        icon: weather.weatherInfo[0].icon,
        lat: weather.weatherCoord.lat,
        lng: weather.weatherCoord.lon,
        name: weather.name ?? "",
        isPast: false);
  }

  final Temperature temp;
  final Temperature feelLike;
  final Temperature minTemp;
  final Temperature maxTemp;
  final String main;
  final String description;
  final DateTime date;
  final String icon;
  final double lat;
  final double lng;
  final String? name;
  final bool? isPast;

  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";
}

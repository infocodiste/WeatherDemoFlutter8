// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_History _$$_HistoryFromJson(Map<String, dynamic> json) => _$_History(
      weatherInfo: (json['hourly'] as List<dynamic>)
          .map((e) => HistoryWeather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HistoryToJson(_$_History instance) =>
    <String, dynamic>{
      'hourly': instance.weatherInfo,
    };

_$_HistoryWeather _$$_HistoryWeatherFromJson(Map<String, dynamic> json) =>
    _$_HistoryWeather(
      dt: json['dt'] as int,
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      clouds: json['clouds'] as int,
      visibility: json['visibility'] as int,
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HistoryWeatherToJson(_$_HistoryWeather instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'weather': instance.weather,
    };

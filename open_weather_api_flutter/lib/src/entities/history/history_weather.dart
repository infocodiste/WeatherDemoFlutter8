import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_weather/src/entities/weather/weather.dart';

part 'history_weather.freezed.dart';

part 'history_weather.g.dart';
/// Historical weather data parsed from the API response (not used directly in the UI)
@freezed
class History with _$History {
  factory History({
    @JsonKey(name: 'hourly') required List<HistoryWeather> weatherInfo,
  }) = _History;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}

@freezed
class HistoryWeather with _$HistoryWeather {
  factory HistoryWeather(
      {required int dt,
      required double temp,
      @JsonKey(name: 'feels_like') required double feelsLike,
      required int pressure,
      required int humidity,
      required int clouds,
      required int visibility,
      required List<WeatherInfo> weather}) = _HistoryWeather;

  factory HistoryWeather.fromJson(Map<String, dynamic> json) =>
      _$HistoryWeatherFromJson(json);
}

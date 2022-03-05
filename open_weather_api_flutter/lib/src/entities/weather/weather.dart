import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

part 'weather.g.dart';

/// Weather data parsed from the API response (not used directly in the UI)
@freezed
class Weather with _$Weather {
  factory Weather({
    @JsonKey(name: 'main') required WeatherParams weatherParams,
    @JsonKey(name: 'weather') required List<WeatherInfo> weatherInfo,
    required int dt,
    String? name,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

/// Weather of nearby city data parsed from the API response (not used directly in the UI)
@freezed
class WeatherPosition with _$WeatherPosition {
  factory WeatherPosition({
    @JsonKey(name: 'main') required WeatherParams weatherParams,
    @JsonKey(name: 'weather') required List<WeatherInfo> weatherInfo,
    @JsonKey(name: 'coord') required WeatherCoord weatherCoord,
    required int dt,
    String? name,
  }) = _WeatherPosition;

  factory WeatherPosition.fromJson(Map<String, dynamic> json) =>
      _$WeatherPositionFromJson(json);
}

@freezed
class WeatherParams with _$WeatherParams {
  factory WeatherParams({
    required double temp,
    @JsonKey(name: 'feels_like') required double feelLike,
    @JsonKey(name: 'temp_min') required double tempMin,
    @JsonKey(name: 'temp_max') required double tempMax,
  }) = _WeatherParams;

  factory WeatherParams.fromJson(Map<String, dynamic> json) =>
      _$WeatherParamsFromJson(json);
}

@freezed
class WeatherInfo with _$WeatherInfo {
  factory WeatherInfo({
    required String main,
    required String description,
    required String icon,
  }) = _WeatherInfo;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
}

@freezed
class WeatherCoord with _$WeatherCoord {
  factory WeatherCoord({
    required double lat,
    required double lon,
  }) = _WeatherCoord;

  factory WeatherCoord.fromJson(Map<String, dynamic> json) =>
      _$WeatherCoordFromJson(json);
}





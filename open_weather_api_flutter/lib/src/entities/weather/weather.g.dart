// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherParams _$$_WeatherParamsFromJson(Map<String, dynamic> json) =>
    _$_WeatherParams(
      temp: (json['temp'] as num).toDouble(),
      feelLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WeatherParamsToJson(_$_WeatherParams instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
    };

_$_WeatherInfo _$$_WeatherInfoFromJson(Map<String, dynamic> json) =>
    _$_WeatherInfo(
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$_WeatherInfoToJson(_$_WeatherInfo instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_$_WeatherCoord _$$_WeatherCoordFromJson(Map<String, dynamic> json) =>
    _$_WeatherCoord(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WeatherCoordToJson(_$_WeatherCoord instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$_WeatherPosition _$$_WeatherPositionFromJson(Map<String, dynamic> json) =>
    _$_WeatherPosition(
      weatherParams:
          WeatherParams.fromJson(json['main'] as Map<String, dynamic>),
      weatherInfo: (json['weather'] as List<dynamic>)
          .map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      weatherCoord:
          WeatherCoord.fromJson(json['coord'] as Map<String, dynamic>),
      dt: json['dt'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_WeatherPositionToJson(_$_WeatherPosition instance) =>
    <String, dynamic>{
      'main': instance.weatherParams,
      'weather': instance.weatherInfo,
      'coord': instance.weatherCoord,
      'dt': instance.dt,
      'name': instance.name,
    };

_$_Weather _$$_WeatherFromJson(Map<String, dynamic> json) => _$_Weather(
      weatherParams:
          WeatherParams.fromJson(json['main'] as Map<String, dynamic>),
      weatherInfo: (json['weather'] as List<dynamic>)
          .map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      dt: json['dt'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'main': instance.weatherParams,
      'weather': instance.weatherInfo,
      'dt': instance.dt,
      'name': instance.name,
    };

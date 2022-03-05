import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:open_weather/src/api/open_weather_map_api.dart';
import 'package:open_weather/src/api/api_keys.dart';
import 'package:open_weather/src/entities/forecast/forecast.dart';
import 'package:open_weather/src/entities/history/history_weather.dart';
import 'package:open_weather/src/entities/location/ip_location.dart';
import 'package:open_weather/src/entities/weather/weather.dart';
import 'package:open_weather/src/entities/weather/weather_data.dart';
import 'package:open_weather/src/repositories/api_error.dart';

/// Http Repository using the http client. Calls API methods and parses responses.
class HttpRepository {
  HttpRepository({required this.api, required this.client});

  final OpenWeatherMapAPI api;
  final http.Client client;

  Future<ipLocation> getIpLocation() => _getData(
        uri: Uri.parse("http://ip-api.com/json/"),
        builder: (data) => ipLocation.fromJson(data),
      );

  Future<Weather> getWeather({required String lat, required String lon}) =>
      _getData(
        uri: api.weather(lat, lon),
        builder: (data) => Weather.fromJson(data),
      );

  Future<Forecast> getForecast({required String lat, required String lon}) =>
      _getData(
        uri: api.forecast(lat, lon),
        builder: (data) => Forecast.fromJson(data),
      );

  Future<History> getHistorical(
          {required String lat, required String lon, required String time}) =>
      _getData(
        uri: api.historical(lat, lon, time),
        builder: (data) => History.fromJson(data),
      );

  Future<List<WeatherData>> findNearWeather(
          {required String lat, required String lon, required String cnt}) =>
      _getData(
        uri: api.findNearWeather(lat, lon, cnt),
        builder: (data) {
          var weatherList = (data['list'] as List<dynamic>).map((e) {
            var data = WeatherData.position(
                WeatherPosition.fromJson(e as Map<String, dynamic>));
            return data;
          }).toList();
          return weatherList;
        },
      );

  Future<Response> getMarker(WeatherData data) async {
    return await client.get(Uri.parse(data.iconUrl));
  }

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw const APIError.invalidApiKey();
        default:
          throw const APIError.unknown();
      }
    } on SocketException catch (_) {
      throw const APIError.noInternetConnection();
    }
  }
}

/// Providers used by rest of the app
final httpRepositoryProvider = Provider<HttpRepository>((ref) {
  /// Use the API key passed via --dart-define,
  /// or fallback to the one defined in api_keys.dart
  final apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: APIKeys.openWeatherAPIKey,
  );
  return HttpRepository(
    api: OpenWeatherMapAPI(apiKey),
    client: http.Client(),
  );
});

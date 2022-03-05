import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:open_weather/src/entities/weather/weather_data.dart';
import 'package:open_weather/src/repositories/api_error.dart';
import 'package:open_weather/src/repositories/http_repository.dart';

class MapViewController
    extends StateNotifier<AsyncValue<Map<WeatherData, Response>>> {
  MapViewController(this._httpRepository,
      {required String lat, required String lon, required String cnt})
      : super(const AsyncValue.loading()) {
    checkNearLocationWeather(lat, lon, cnt);
  }

  final HttpRepository _httpRepository;

  Future<void> checkNearLocationWeather(
      String lat, String lng, String cnt) async {
    try {
      state = const AsyncValue.loading();
      final weatherList =
          await _httpRepository.findNearWeather(lat: lat, lon: lng, cnt: cnt);
      Map<WeatherData, Response> markerData = <WeatherData, Response>{};
      var i = 0;
      while (i != weatherList.length) {
        var markerResp = await _httpRepository.getMarker(weatherList[i]);
        markerData.putIfAbsent(weatherList[i], () => markerResp);
        i++;
      }
      state = AsyncValue.data(markerData);
    } on APIError catch (e) {
      state = e.asAsyncValue();
    }
  }
}

final mapViewControllerProvider = StateNotifierProvider.autoDispose
    .family<MapViewController, AsyncValue<Map<WeatherData, Response>>, String>(
        (ref, arg) {
  List args = arg.split(",");
  final httpRepository = ref.watch(httpRepositoryProvider);
  return MapViewController(
    httpRepository,
    lat: args[0],
    lon: args[1],
    cnt: args[2],
  );
});

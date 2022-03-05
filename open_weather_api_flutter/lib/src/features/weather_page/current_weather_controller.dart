import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/src/entities/weather/weather_data.dart';
import 'package:open_weather/src/repositories/api_error.dart';
import 'package:open_weather/src/repositories/http_repository.dart';

class CurrentWeatherController extends StateNotifier<AsyncValue<WeatherData>> {
  CurrentWeatherController(this._weatherRepository,
      {required String lat, required String lon})
      : super(const AsyncValue.loading()) {
    getWeather(lat: lat, lon: lon);
  }

  final HttpRepository _weatherRepository;

  Future<void> getWeather({required String lat, required String lon}) async {
    try {
      state = const AsyncValue.loading();
      final weather = await _weatherRepository.getWeather(lat: lat, lon: lon);
      state = AsyncValue.data(WeatherData.from(weather));
    } on APIError catch (e) {
      state = e.asAsyncValue();
    }
  }
}

final currentWeatherControllerProvider = StateNotifierProvider.autoDispose
    .family<CurrentWeatherController, AsyncValue<WeatherData>, String>(
        (ref, latLng) {
  final weatherRepository = ref.watch(httpRepositoryProvider);
  List<String> list = latLng.split(",");
  return CurrentWeatherController(weatherRepository,
      lat: list[0], lon: list[1]);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/src/entities/forecast/forecast_data.dart';
import 'package:open_weather/src/entities/temperature.dart';
import 'package:open_weather/src/entities/weather/weather_data.dart';
import 'package:open_weather/src/repositories/api_error.dart';
import 'package:open_weather/src/repositories/http_repository.dart';

class DailyWeatherController extends StateNotifier<AsyncValue<ForecastData>> {
  DailyWeatherController(this._weatherRepository,
      {required String lat, required String lon})
      : super(const AsyncValue.loading()) {
    getHistoricalWeather(lat: lat, lon: lon);
  }

  final HttpRepository _weatherRepository;

  Future<void> getHistoricalWeather(
      {required String lat, required String lon}) async {
    try {
      state = const AsyncValue.loading();
      final forecast = await _weatherRepository.getForecast(lat: lat, lon: lon);
      var forecastData = ForecastData.from(forecast);
      // API returns data points in 3-hour intervals -> 1 day = 8 intervals
      final items = [0, 8, 16, 24, 32];
      List<WeatherData> weatherData = [
        for (var i in items) forecastData.list[i]
      ];
      int day = 1;
      while (day != 4) {
        DateTime dateTime = DateTime.now().subtract(Duration(days: day));
        final historical = await _weatherRepository.getHistorical(
            lat: lat,
            lon: lon,
            time: "${dateTime.millisecondsSinceEpoch ~/ 1000}");
        final history1 = historical.weatherInfo.first;
        var hWeatherData = WeatherData(
            temp: Temperature.celsius(history1.temp),
            feelLike: Temperature.celsius(history1.feelsLike),
            minTemp: Temperature.celsius(history1.temp),
            maxTemp: Temperature.celsius(history1.temp),
            main: history1.weather.first.main,
            description: history1.weather.first.description,
            date: DateTime.fromMillisecondsSinceEpoch(history1.dt * 1000),
            icon: history1.weather.first.icon,
            lat: 0.0,
            lng: 0.0,
            name: "",
            isPast: true);
        weatherData.insert(0, hWeatherData);
        day++;
      }
      forecastData.list.clear();
      forecastData.list.addAll(weatherData);
      state = AsyncValue.data(forecastData);
    } on APIError catch (e) {
      state = e.asAsyncValue();
    }
  }
}

final dailyWeatherControllerProvider = StateNotifierProvider.autoDispose
    .family<DailyWeatherController, AsyncValue<ForecastData>, String>(
        (ref, latLng) {
  List<String> list = latLng.split(",");
  final weatherRepository = ref.watch(httpRepositoryProvider);
  return DailyWeatherController(weatherRepository, lat: list[0], lon: list[1]);
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/src/entities/weather/weather_data.dart';
import 'package:open_weather/src/features/weather_page/current_weather_controller.dart';
import 'package:open_weather/src/features/weather_page/weather_icon_image.dart';

/// User current weather data widget
class CurrentWeather extends ConsumerWidget {
  const CurrentWeather({Key? key, required this.lat, required this.lon})
      : super(key: key);
  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<double> list = [lat, lon];
    final weatherDataValue =
        ref.watch(currentWeatherControllerProvider(list.join(",")));
    return weatherDataValue.when(
      data: (weatherData) => CurrentWeatherContents(data: weatherData),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Text(e.toString()),
    );
  }
}

class CurrentWeatherContents extends ConsumerWidget {
  const CurrentWeatherContents({Key? key, required this.data})
      : super(key: key);
  final WeatherData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final location = data.name;
    final temp = data.temp.celsius.toInt().toString();
    final feelLike = data.feelLike.celsius.toInt().toString();
    final minTemp = data.minTemp.celsius.toInt().toString();
    final maxTemp = data.maxTemp.celsius.toInt().toString();
    final highAndLow = 'H:$maxTemp° / L:$minTemp°';
    final date = DateFormat("E, d MMM h:mm").format(data.date);
    final desc = data.main;
    return Card(
      margin: const EdgeInsets.all(16),
      color: Colors.black54,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(Icons.location_pin),
                const SizedBox(width: 12),
                Text(location!, style: textTheme.headline5),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(date, style: textTheme.bodyText2),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    WeatherIconImage(iconUrl: data.iconUrl, size: 92),
                    Text("$temp°", style: textTheme.headline2),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(desc, style: textTheme.bodyText1),
                    const SizedBox(height: 8),
                    Text(highAndLow, style: textTheme.bodyText2),
                    const SizedBox(height: 8),
                    Text("Feel like $feelLike°", style: textTheme.bodyText2),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/src/entities/date_time_helper.dart';
import 'package:open_weather/src/entities/weather/weather_data.dart';
import 'package:open_weather/src/features/weather_page/daily_weather_controller.dart';
import 'package:open_weather/src/features/weather_page/weather_icon_image.dart';

/// Showing User daily weather from 5-day forecast and historical weather data
class DailyWeather extends ConsumerWidget {
  const DailyWeather({Key? key, required this.lat, required this.lon})
      : super(key: key);
  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastDataValue =
        ref.watch(dailyWeatherControllerProvider("$lat,$lon"));
    return forecastDataValue.when(
      data: (forecastData) {
        // API returns data points in 3-hour intervals -> 1 day = 8 intervals
        return DailyWeatherColumn(
          weatherDataItems: forecastData.list,
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Text(e.toString()),
    );
  }
}

class DailyWeatherColumn extends StatelessWidget {
  const DailyWeatherColumn({Key? key, required this.weatherDataItems})
      : super(key: key);
  final List<WeatherData> weatherDataItems;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: Colors.black54,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: weatherDataItems
                .map((data) => DailyWeatherItem(data: data))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class DailyWeatherItem extends ConsumerWidget {
  const DailyWeatherItem({Key? key, required this.data}) : super(key: key);
  final WeatherData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;
    final maxTemp = data.maxTemp.celsius.toInt().toString();
    final minTemp = data.minTemp.celsius.toInt().toString();
    final highAndLow = '$maxTemp° / $minTemp°';
    final isPast = data.isPast;
    return Row(
      children: [
        Expanded(
          child: Text(
            data.date.isYesterday()
                ? "Yesterday"
                : data.date.isToday()
                    ? "Today"
                    : data.date.isTomorrow()
                        ? "Tomorrow"
                        : DateFormat("EEEE").format(data.date),
            style: textTheme.headline6!.copyWith(
                fontWeight: fontWeight,
                color: (isPast ?? false) ? Colors.blueGrey : Colors.white),
          ),
        ),
        WeatherIconImage(iconUrl: data.iconUrl, size: 48),
        Expanded(
          child: Text(
            highAndLow,
            textAlign: TextAlign.right,
            style: textTheme.bodyText1!.copyWith(
                fontWeight: fontWeight,
                color: (isPast ?? false) ? Colors.blueGrey : Colors.white),
          ),
        ),
      ],
    );
  }
}

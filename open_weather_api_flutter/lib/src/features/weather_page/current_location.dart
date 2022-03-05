import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_weather/src/features/map_page/map_view.dart';
import 'package:open_weather/src/features/weather_page/current_location_controller.dart';
import 'package:open_weather/src/features/weather_page/current_weather.dart';
import 'package:open_weather/src/features/weather_page/daily_weather.dart';

/// showing weather data base on user current location
/// if location permission denied then find location from ip locator
class CurrentLocation extends ConsumerWidget {
  final LatLng? latLng;

  const CurrentLocation({Key? key, this.latLng}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (latLng == null) {
      final locationDataValue =
          ref.watch(currentLocationControllerProvider(""));
      return locationDataValue.when(
        data: (locationData) => CurrentLocationContents(data: locationData),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, __) => Text(e.toString()),
      );
    } else {
      return CurrentLocationContents(data: latLng!);
    }
  }
}

class CurrentLocationContents extends ConsumerWidget {
  const CurrentLocationContents({Key? key, required this.data})
      : super(key: key);
  final LatLng data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Center(
                child: Text("Weather", style: textTheme.headline3),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    padding: const EdgeInsets.only(top: 12, right: 24),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapView(latLng: data)),
                      );
                    },
                    icon: const Icon(Icons.map,
                        color: Colors.orangeAccent, size: 36)),
              )
            ],
          ),
        ),
        Expanded(
            flex: 4,
            child: CurrentWeather(lat: data.latitude, lon: data.longitude)),
        Expanded(
            flex: 7,
            child: DailyWeather(lat: data.latitude, lon: data.longitude)),
      ],
    );
  }
}

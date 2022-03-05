import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:open_weather/src/constants/app_colors.dart';
import 'package:open_weather/src/entities/weather/weather_data.dart';
import 'package:open_weather/src/features/map_page/map_view_controller.dart';

/// Google Map Screen showing list of Marker with weather data
class MapView extends ConsumerWidget {
  final LatLng? latLng;

  const MapView({Key? key, this.latLng}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationDataValue = ref.watch(mapViewControllerProvider(
        "${latLng!.latitude},${latLng!.longitude},10"));

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.rainGradient,
          ),
        ),
        child: SafeArea(
          child: locationDataValue.when(
            data: (weatherMarkerData) => MapViewContents(
                position: latLng!, markerData: weatherMarkerData),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, __) => Text(e.toString()),
          ),
        ),
      ),
    );
  }
}

class MapViewContents extends ConsumerWidget {
  MapViewContents({Key? key, required this.position, required this.markerData})
      : super(key: key);
  final LatLng position;
  final Map<WeatherData, Response> markerData;

  LatLng? positionOnMap;
  Set<Marker> markers = <Marker>{};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    markerData.forEach((wData, mImg) {
      var marker = Marker(
          markerId: MarkerId("${wData.lat} : ${wData.lng}".toString()),
          icon: BitmapDescriptor.fromBytes(mImg.bodyBytes.buffer.asUint8List()),
          position: LatLng(wData.lat.toDouble(), wData.lng.toDouble()),
          onTap: () {
            _showWeatherDetailsOnBottom(wData, context);
          });
      markers.add(marker);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Text("Weather On Map", style: textTheme.headline4),
          ),
        ),
        Expanded(
            flex: 9,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              mapType: MapType.hybrid,
              initialCameraPosition: getCameraPosition(),
              markers: markers,
              onCameraMove: _onCameraMove,
            )),
      ],
    );
  }

  /// Google map camera position
  CameraPosition getCameraPosition() {
    return CameraPosition(
      target: position,
      zoom: 12,
    );
  }

  /// called after map successfully created and
  /// zoom map as much to show all marker in screen.
  _onMapCreated(GoogleMapController controller) {
    controller
        .animateCamera(CameraUpdate.newLatLngBounds(_bounds(markers)!, 50));
  }

  /// Getting google map bound from all marker
  LatLngBounds? _bounds(Set<Marker> markers) {
    if (markers.isEmpty) return null;
    return _createBounds(markers.map((m) => m.position).toList());
  }

  LatLngBounds _createBounds(List<LatLng> positions) {
    final southwestLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value < element ? value : element); // smallest
    final southwestLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value < element ? value : element);
    final northeastLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value > element ? value : element); // biggest
    final northeastLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value > element ? value : element);
    return LatLngBounds(
        southwest: LatLng(southwestLat, southwestLon),
        northeast: LatLng(northeastLat, northeastLon));
  }

  _onCameraMove(CameraPosition position) {
    positionOnMap = position.target;
  }

  /// showing weather details in bottom screen once tap on marker.
  _showWeatherDetailsOnBottom(WeatherData wData, BuildContext context) {
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 175,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: AppColors.rainBlueDark.withOpacity(0.85),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          wData.iconUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        "${wData.temp.celsius.toInt()}°",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 8),
                      Text(wData.main,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24)),
                      const SizedBox(height: 8),
                      Text(wData.description,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      const SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${wData.lat.toDouble()} , ${wData.lng.toDouble()}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_city,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 5),
                          Text(wData.name!,
                              style: const TextStyle(
                                color: Colors.white,
                              ))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_weather/src/constants/app_colors.dart';
import 'package:open_weather/src/features/weather_page/current_location.dart';
import 'package:permission_handler/permission_handler.dart';

/// App Landing (Home) screen
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isLoading = true;
  LatLng? latLng;

  @override
  void initState() {
    super.initState();
    checkLocationPermission(context);
  }

  checkLocationPermission(BuildContext context) async {
    if (await Permission.location.request().isGranted) {
      Position? currentPosition = await Geolocator.getLastKnownPosition();
      if (currentPosition != null && currentPosition.latitude != 0.0) {
        latLng = LatLng(currentPosition.latitude, currentPosition.longitude);
      }
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
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
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : CurrentLocation(latLng: latLng),
        ),
      ),
    );
  }
}

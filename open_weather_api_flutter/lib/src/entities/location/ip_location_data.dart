import 'package:open_weather/src/entities/location/ip_location.dart';

/// Derived model class used in the UI
class ipLocationData {
  ipLocationData(
      {required this.status,
      required this.country,
      required this.countryCode,
      required this.region,
      required this.regionName,
      required this.city,
      required this.zip,
      required this.lat,
      required this.lon});

  factory ipLocationData.from(ipLocation location) {
    return ipLocationData(
        lat: location.lat,
        city: location.city,
        country: location.country,
        region: location.region,
        lon: location.lon,
        status: location.status,
        regionName: location.regionName,
        countryCode: location.countryCode,
        zip: location.zip);
  }

  final String status;
  final String country;
  final String countryCode;
  final String region;
  final String regionName;
  final String city;
  final String zip;
  final double lat;
  final double lon;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ip_location.freezed.dart';

part 'ip_location.g.dart';

/// ip Location data parsed from the API response (not used directly in the UI)
@freezed
class ipLocation with _$ipLocation {
  factory ipLocation({
    required String status,
    required String country,
    required String countryCode,
    required String region,
    required String regionName,
    required String city,
    required String zip,
    required double lat,
    required double lon,
  }) = _ipLocation;

  factory ipLocation.fromJson(Map<String, dynamic> json) =>
      _$ipLocationFromJson(json);
}

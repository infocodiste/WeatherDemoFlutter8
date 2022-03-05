// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ipLocation _$$_ipLocationFromJson(Map<String, dynamic> json) =>
    _$_ipLocation(
      status: json['status'] as String,
      country: json['country'] as String,
      countryCode: json['countryCode'] as String,
      region: json['region'] as String,
      regionName: json['regionName'] as String,
      city: json['city'] as String,
      zip: json['zip'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ipLocationToJson(_$_ipLocation instance) =>
    <String, dynamic>{
      'status': instance.status,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'region': instance.region,
      'regionName': instance.regionName,
      'city': instance.city,
      'zip': instance.zip,
      'lat': instance.lat,
      'lon': instance.lon,
    };

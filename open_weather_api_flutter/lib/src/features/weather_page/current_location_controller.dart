import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_weather/src/entities/location/ip_location_data.dart';
import 'package:open_weather/src/repositories/api_error.dart';
import 'package:open_weather/src/repositories/http_repository.dart';

class CurrentLocationController extends StateNotifier<AsyncValue<LatLng>> {
  CurrentLocationController(this._httpRepository)
      : super(const AsyncValue.loading()) {
    getIpLocation();
  }

  final HttpRepository _httpRepository;

  Future<void> getIpLocation() async {
    try {
      state = const AsyncValue.loading();
      final location = await _httpRepository.getIpLocation();
      LatLng latLng = LatLng(location.lat, location.lon);
      state = AsyncValue.data(latLng);
    } on APIError catch (e) {
      state = e.asAsyncValue();
    }
  }
}

final currentLocationControllerProvider = StateNotifierProvider.autoDispose
    .family<CurrentLocationController, AsyncValue<LatLng>, String>((ref, arg) {
  final httpRepository = ref.watch(httpRepositoryProvider);
  return CurrentLocationController(httpRepository);
});

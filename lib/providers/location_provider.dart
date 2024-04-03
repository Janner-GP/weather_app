import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart'; // Asegúrate de importar geocoding

final locationNotifier = StateNotifierProvider<LocationNotifier, LocationState>((ref) => LocationNotifier());

class LocationNotifier extends StateNotifier<LocationState> {

  LocationNotifier() : super(LocationState()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final position = await getLocation();
      final placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      final place = placeMarks.first;

      state = LocationState(
        latitude: position.latitude,
        longitude: position.longitude,
        city: place.locality,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<Position> getLocation() async {
    LocationPermission permission;

    // Verificar si se tiene permiso de ubicación
    permission = await Geolocator.checkPermission();

    // Solicitar permiso de ubicación
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      // Verificar si se denegó el permiso
      if (permission == LocationPermission.denied) {
        return Future.error('Permiso de ubicación denegado');
      }
    }

    // Retornar la ubicación actual
    return await Geolocator.getCurrentPosition();
  }
}

class LocationState {
  final double? latitude;
  final double? longitude;
  final String? city;

  LocationState({ this.latitude, this.longitude, this.city });

  LocationState copyWith({ double? latitude, double? longitude, String? city }) {
    return LocationState(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      city: city ?? this.city, // Añadir la ciudad al método copyWith
    );
  }
}

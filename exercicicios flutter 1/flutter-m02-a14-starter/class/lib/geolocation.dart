import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:wonderful_cities/models/exception.dart';
import 'package:wonderful_cities/models/location.dart';

class Geolocation {
  StreamController<Location> _myLocationController = StreamController();
  StreamSubscription? _subscription;
  Stream<Location> get myLocationStream => _myLocationController.stream;

  void listenToMyLocation() {
    if (_myLocationController.isClosed) {
      _myLocationController = StreamController();
    }
    _subscription = Geolocator.getPositionStream()
        .map((position) => Location(position.latitude, position.longitude))
        .distinct(((previous, next) =>
            previous.latitude == next.latitude &&
            previous.longitude == next.longitude))
        .handleError((error) => _handleGpsDisabled(error),
            test: (error) => error is LocationServiceDisabledException)
        .listen((location) => _myLocationController.add(location));
  }

  void _handleGpsDisabled(LocationServiceDisabledException error) {
    final exception = GpsDisabledException(error.toString());
    _myLocationController.addError(exception);
  }

  void closeMyLocationStream() {
    _subscription?.cancel();
    _myLocationController.close();
  }

  bool _hasPermission(LocationPermission locationPermission) {
    return locationPermission == LocationPermission.whileInUse ||
        locationPermission == LocationPermission.always;
  }

  Future<bool> checkPermission() async {
    final locationPermission = await Geolocator.checkPermission();
    return _hasPermission(locationPermission);
  }
  // Future<bool> checkPermission() {
  //   return Geolocator.checkPermission().then(_hasPermission);
  // }

  Future<bool> requestPermission() async {
    final locationPermission = await Geolocator.requestPermission();
    return _hasPermission(locationPermission);
  }

  // Future<bool> requestPermission() {
  //   return Geolocator.requestPermission().then(_hasPermission);
  // }
  double distanceBetween(Location locationA, Location locationB) {
    return Geolocator.distanceBetween(
      locationA.latitude,
      locationA.longitude,
      locationB.latitude,
      locationB.longitude,
    );
  }

  void openLocationSettings() => Geolocator.openLocationSettings();

  Future<bool> isGpsEnabled() async => Geolocator.isLocationServiceEnabled();
}

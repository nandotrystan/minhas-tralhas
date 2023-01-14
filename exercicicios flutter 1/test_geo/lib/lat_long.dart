import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class LatandLong extends ChangeNotifier {
  static final LatandLong controle = LatandLong._();
  LatandLong._();
  double latitude = 0;
  double longitude = 0;
  String error = '';

  pointsController() {
    fetchPosition();
  }

  void fetchPosition() async {
    try {
      Position position = await _actualPosition();
      latitude = position.latitude;
      longitude = position.longitude;

      print('latitude: $latitude, longitude: $longitude');
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _actualPosition() async {
    LocationPermission permission;
    bool active = await Geolocator.isLocationServiceEnabled();

    if (!active) {
      return Future.error('Por Favor, libere sua GeoLocalização');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}

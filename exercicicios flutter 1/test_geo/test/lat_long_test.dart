import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';

class GeoMock extends Mock implements Geolocator {}

void main() {
  late Geolocator geo;
  setUp(() async{
    geo = GeoMock();
    
  });
  test('description', () async {
    when(geo.)
    await geo.getCurrentPosition();
  });
}

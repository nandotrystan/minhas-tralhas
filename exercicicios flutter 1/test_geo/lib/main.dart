import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_geo/lat_long.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => LatandLong.controle, child: const MyWidget()));
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _controller = LatandLong.controle;

  @override
  void initState() {
    super.initState();
    _controller.pointsController();
  }

  @override
  Widget build(BuildContext context) {
    final local = context.watch<LatandLong>();
    String msg = _controller.error == ''
        ? 'Latitude: ${local.latitude}, Longitude: ${local.longitude}'
        : _controller.error;
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Consumer<LatandLong>(builder: (context, value, child) {
          return Text(msg);
        })),
      ),
    );
  }
}

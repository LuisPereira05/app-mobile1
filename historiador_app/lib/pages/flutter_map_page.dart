import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pracashistoriador/api/auth_service.dart';
import 'package:pracashistoriador/db/isar/interest_point.dart';
import 'package:pracashistoriador/db/isar/isar_service.dart';
import 'package:provider/provider.dart';

import '../db/interest_point_api.dart';
import '../db/interest_point_api_service.dart';

class FlutterMapPage extends StatefulWidget {
  final String token;

  

  const FlutterMapPage({super.key, required this.token});

  @override
  State<FlutterMapPage> createState() => _FlutterMapPageState();
}

class _FlutterMapPageState extends State<FlutterMapPage> {
  LatLng? _currentPosition;
  List<InterestPointApi> _apiPontos = [];
  List<InterestPoint> _localPontos = [];

  late InterestPointApiService _apiService;

  @override
  void initState() {
    super.initState();

    Future.microtask((){
      final auth = Provider.of<AuthService>(context, listen: false);
      _apiService = InterestPointApiService(baseUrl: auth.baseUrl!);
    });

    _getCurrentLocation();
    _loadApiPontos();
    _loadLocalPontos();
  }

  Future<void> _getCurrentLocation() async {
    var status = await Permission.location.request();
    if (!status.isGranted) return;

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  Future<void> _loadApiPontos() async {
    try {
      final pontos = await _apiService.fetchAll(token: widget.token);
      setState(() {
        _apiPontos = pontos;
      });
    } catch (e) {
      print("Erro ao carregar pontos da API: $e");
    }
  }

  Future<void> _loadLocalPontos() async {
    try {
      final pontos = await IsarService().getAllInterestPoints();
      setState(() {
        _localPontos = pontos;
      });
    } catch (e) {
      print("Erro ao carregar pontos locais: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPosition == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return FlutterMap(
      options: MapOptions(center: _currentPosition, zoom: 15),
      children: [
        TileLayer(
          urlTemplate: 'https://a.tile.openstreetmap.de/tiles/osmde/{z}/{x}/{y}.png',
        ),
        MarkerLayer(
          markers: [
            // Localização atual
            Marker(
              point: _currentPosition!,
              width: 80,
              height: 80,
              child: const Icon(
                Icons.my_location,
                size: 40,
                color: Colors.blue,
              ),
            ),
            // Pontos da API - ícones roxos
            ..._apiPontos.map(
              (p) => Marker(
                point: LatLng(p.lat, p.lon),
                width: 60,
                height: 60,
                child: Tooltip(
                  message: p.name,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.purple,
                    size: 35,
                  ),
                ),
              ),
            ),
            // Pontos locais - ícones verdes
            ..._localPontos.map(
              (p) => Marker(
                point: LatLng(p.lat, p.lon),
                width: 60,
                height: 60,
                child: Tooltip(
                  message: p.name,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
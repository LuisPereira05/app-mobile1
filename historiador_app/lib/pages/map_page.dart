import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pracashistoriador/api/auth_service.dart';
import 'package:pracashistoriador/db/interest_point_api.dart';
import 'package:pracashistoriador/db/interest_point_api_service.dart';
import 'package:pracashistoriador/db/isar/isar_service.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _mapController;
  LatLng _initialPosition = const LatLng(-30.8831, -55.5306); // Santana do Livramento

  Set<Marker> apiMarkers = {};
  Set<Marker> localMarkers = {};

  late InterestPointApiService apiService;

  @override
  void initState() {
    super.initState();
    _getUserLocation();

    apiService = InterestPointApiService(baseUrl: Provider.of<AuthService>(context).baseUrl!);
  }

  Future<void> loadMarkers() async {
    try {
      final apiPoints = await apiService.fetchAll(token: Provider.of<AuthService>(context).token!);
      final localPoints = await IsarService().getAllInterestPoints();

      Set<Marker> newApiMarkers = {};
      Set<Marker> newLocalMarkers = {};

      for (var point in apiPoints) {
        newApiMarkers.add(
          Marker(
            markerId: MarkerId('api_${point.objectId ?? point.name}'),
            position: LatLng(point.lat, point.lon),
            infoWindow: InfoWindow(title: point.name, snippet: 'API point'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
        );
      }

      for (var point in localPoints) {
        newLocalMarkers.add(
          Marker(
            markerId: MarkerId('local_${point.id}'),
            position: LatLng(point.lat, point.lon),
            infoWindow: InfoWindow(title: point.name, snippet: 'Local point'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          ),
        );
      }

      setState(() {
        apiMarkers = newApiMarkers;
        localMarkers = newLocalMarkers;
        print("-------------------------------- CARREGADOS MARKERS");
      });
    } catch (e) {
      print('Error loading markers: $e');
    }
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) return;

    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller)  {
        _mapController = controller;
        loadMarkers();
        
        },
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: 14,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: {...apiMarkers, ...localMarkers},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapaSelecaoPage extends StatefulWidget {
  const MapaSelecaoPage({super.key});

  @override
  State<MapaSelecaoPage> createState() => _MapaSelecaoPageState();
}

class _MapaSelecaoPageState extends State<MapaSelecaoPage> {
  LatLng? posicaoSelecionada;

  @override
  void initState() {
    super.initState();
    _carregarLocalizacaoAtual();
  }

  Future<void> _carregarLocalizacaoAtual() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      print("------------------- SERVICE NOT ENABLED");
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        print("--------------- PERMISSION DENIED FOREVER");
        return;
      }
    }

    final pos = await Geolocator.getCurrentPosition();
    setState(() {
      posicaoSelecionada = LatLng(pos.latitude, pos.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecione a localização')),
      body: posicaoSelecionada == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                center: posicaoSelecionada,
                zoom: 15,
                onTap: (tapPos, latlng) {
                  setState(() {
                    posicaoSelecionada = latlng;
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://a.tile.openstreetmap.de/tiles/osmde/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: posicaoSelecionada!,
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.location_pin, size: 40, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
      floatingActionButton: posicaoSelecionada == null
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                Navigator.pop(context, {
                  'lat': posicaoSelecionada!.latitude.toString(),
                  'lng': posicaoSelecionada!.longitude.toString(),
                });
              },
              label: const Text('Confirmar'),
              icon: const Icon(Icons.check),
            ),
    );
  }
}
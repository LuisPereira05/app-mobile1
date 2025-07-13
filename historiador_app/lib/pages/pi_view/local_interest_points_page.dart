import 'package:flutter/material.dart';
import 'package:pracashistoriador/pages/pi_view/interest_point_details.dart';
import 'package:pracashistoriador/widgets/list_view/grid_list.dart';
import 'package:pracashistoriador/widgets/photo.dart';
import '../../db/isar/interest_point.dart';
import '../../db/isar/isar_service.dart';

class LocalInterestPointPage extends StatefulWidget {
  const LocalInterestPointPage({super.key});

  @override
  State<LocalInterestPointPage> createState() => _LocalInterestPointPageState();
}

class _LocalInterestPointPageState extends State<LocalInterestPointPage> {
  bool isLoading = true;
  List<InterestPoint> listIPs = [];
  Map<Photo, InterestPoint> photoToIP = {}; // <-- Inicialização segura

  @override
  void initState() {
    super.initState();
    _fetchLocalIPs();
  }

  Future<void> _fetchLocalIPs() async {
    final data = await IsarService().getAllInterestPoints();

    if (!mounted) return;

    setState(() {
      listIPs = data;
      photoToIP = {
        for (var ip in data.where((ip) => ip.fotos.isNotEmpty))
          Photo(
            assetName: ip.fotos.first,
            isLocal: true,
            title: ip.name,
            subtitle: ip.descripcion ?? '',
          ): ip,
      };
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return GridList(
      type: GridListType.footer,
      photos: photoToIP.keys.toList(),
      isLocal: true,
      onTap: (photo) {
        final ip = photoToIP[photo];
        if (ip != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => InterestPointDetailPage(interestPoint: ip),
            ),
          );
        }
      },
    );
  }
}
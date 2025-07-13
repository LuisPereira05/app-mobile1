import 'package:flutter/material.dart';
import 'package:pracashistoriador/api/interest_points_api.dart';
import 'package:pracashistoriador/mongo/interest_point.dart';
import 'package:pracashistoriador/widgets/list_view/grid_list.dart';
import 'package:pracashistoriador/widgets/photo.dart';
import 'interest_point_details.dart';

class InterestPointPage extends StatefulWidget {
  const InterestPointPage({super.key});

  @override
  State<InterestPointPage> createState() => _InterestPointPageState();
}

class _InterestPointPageState extends State<InterestPointPage> {
  bool isLoading = true;
  List<InterestPoint> listIPs = [];
  late Map<Photo, InterestPoint> photoToIP;

  @override
  void initState() {
    super.initState();
    _fetchIPs();
  }

  Future<void> _fetchIPs() async {
    final data = await getAllInterestPoints();
    if (!mounted) return;

    setState(() {
      listIPs = data;
      photoToIP = {
        for (var ip in data.where((ip) => ip.fotos.isNotEmpty))
          Photo(
            assetName: ip.fotos.first,
            title: ip.name,
            subtitle: ip.descripcion ?? '',
            isLocal: false,
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
      isLocal: false,
      onTap: (photo) {
        final ip = photoToIP[photo];
        print("-------------------- TAPPED ON INTEREST POINT: " + ip!.name);
        if (ip != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => InterestPointDetailApiPage(interestPoint: ip),
            ),
          );
        }
      },
    );
  }
}
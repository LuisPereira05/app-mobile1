import 'package:flutter/material.dart';
import 'package:pracashistoriador/pages/interest_points_page.dart';
import 'local_interest_points_page.dart';


class InterestPointView extends StatefulWidget {
  const InterestPointView({super.key});

  @override
  State<InterestPointView> createState() => _InterestPointViewState();
}

class _InterestPointViewState extends State<InterestPointView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pontos de Interesse'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'API'),
              Tab(text: 'Local'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InterestPointPage(), // API
            LocalInterestPointPage(),  // Local
          ],
        ),
      ),
    );
  }
}
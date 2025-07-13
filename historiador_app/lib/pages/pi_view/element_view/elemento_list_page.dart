import 'dart:io';

import 'package:flutter/material.dart';
import '../../../db/isar/elemento_pi.dart';
import '../../../db/isar/isar_service.dart';
import 'elemento_details.dart';

class ElementListPage extends StatefulWidget {
  final int interestPointIsarId; // id do InterestPoint local

  const ElementListPage({super.key, required this.interestPointIsarId});

  @override
  State<ElementListPage> createState() => _ElementListPageState();
}

class _ElementListPageState extends State<ElementListPage> {
  List<ElementoPI> elementos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadElementos();
  }

  Future<void> _loadElementos() async {
    // Buscando elementos pelo id do InterestPoint via IsarService
    final data = await IsarService().getElementosByInterestPointId(widget.interestPointIsarId);

    if (!mounted) return;

    setState(() {
      elementos = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elementos Associados"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : elementos.isEmpty
              ? const Center(child: Text("Nenhum elemento encontrado."))
              : ListView.builder(
                  itemCount: elementos.length,
                  itemBuilder: (context, index) {
                    print("----------------------ITEM BUILDER");
                    final elem = elementos[index];
                    return ListTile(
                      leading: elem.photos.isNotEmpty
                          ? Image.file(
                              File(elem.photos.first),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                            )
                          : const Icon(Icons.image_not_supported),
                      title: Text(elem.name),
                      subtitle: Text(elem.description),
                      onTap: () {
                        print('Abrindo detalhes de: ${elem.name}');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ElementoDetailsPage(elemento: elem),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
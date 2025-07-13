import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pracashistoriador/pages/pi_view/edit_interest_point.dart';
import '../../db/isar/interest_point.dart';
import '../../db/isar/elemento_pi.dart';
import '../../db/isar/isar_service.dart';
import './element_view/elemento_details.dart';

class InterestPointDetailPage extends StatelessWidget {
  final InterestPoint interestPoint;

  const InterestPointDetailPage({super.key, required this.interestPoint});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> personalizados = {};
    try {
      personalizados = jsonDecode(interestPoint.personalizados ?? '{}');
    } catch (e) {
      print('Erro ao decodificar personalizados: $e');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(interestPoint.name),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Editar Ponto',
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PIEditFormPageLocal(interestPoint: interestPoint),
                  // ou PIEditFormPage se usar API
                ),
              );
              if (result == true) {
                // Se quiser, aqui pode recarregar a página ou atualizar dados
                // Por exemplo, usando setState se fosse StatefulWidget, ou outro método
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (interestPoint.fotos.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(interestPoint.fotos.first),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 200,
                    child: Center(child: Icon(Icons.broken_image, size: 50)),
                  );
                },
              ),
            ),
          const SizedBox(height: 16),
          Text(
            interestPoint.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          InfoRow(label: "Tipo", value: interestPoint.tipo),
          InfoRow(label: "Bairro", value: interestPoint.bairro),
          InfoRow(label: "Endereço", value: interestPoint.endereco),
          InfoRow(label: "Descrição", value: interestPoint.descripcion),
          InfoRow(label: "Latitude", value: interestPoint.lat.toString()),
          InfoRow(label: "Longitude", value: interestPoint.lon.toString()),
          const SizedBox(height: 16),
          const Text(
            "Campos adicionais",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...personalizados.entries.map((entry) => InfoRow(
                label: entry.key,
                value: entry.value.toString(),
              )),
          const SizedBox(height: 24),
          const Text(
            "Elementos Associados",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          // Janela interna para lista de elementos
          SizedBox(
            height: 250, // altura fixa para a janela
            child: ElementListWindow(interestPointIsarId: interestPoint.id),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class ElementListWindow extends StatefulWidget {
  final int interestPointIsarId;

  const ElementListWindow({super.key, required this.interestPointIsarId});

  @override
  State<ElementListWindow> createState() => _ElementListWindowState();
}

class _ElementListWindowState extends State<ElementListWindow> {
  List<ElementoPI> elementos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadElementos();
  }

  Future<void> _loadElementos() async {
    final data = await IsarService().getElementosByInterestPointId(widget.interestPointIsarId);
    if (!mounted) return;

    setState(() {
      elementos = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (elementos.isEmpty) {
      return const Center(child: Text("Nenhum elemento encontrado."));
    }

    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: elementos.length,
        itemBuilder: (context, index) {
          
          final elem = elementos[index];
          print('itemBuilder index: $index, elem: ${elem.name}');
          return ListTile(
            leading: (elem.photos != null && elem.photos!.isNotEmpty)
                ? Image.file(
                    File(elem.photos!.first),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                  )
                : const Icon(Icons.image_not_supported),

            title: Text(elem.name ?? 'Sem nome'),
            subtitle: Text(elem.description ?? ''),
            onTap: () {
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
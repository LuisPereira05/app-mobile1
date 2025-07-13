import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pracashistoriador/mongo/interest_point.dart';
import 'editar_interest_point.dart';
import 'element_list_view.dart';

class InterestPointDetailApiPage extends StatelessWidget {
  final InterestPoint interestPoint;

  const InterestPointDetailApiPage({super.key, required this.interestPoint});

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
            // Navegar para a página de edição, esperar o resultado
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PIEditFormPage(
                  interestPoint: interestPoint,
                ),
              ),
            );
            // Se retornou true, significa que o ponto foi atualizado, você pode fazer algo
            if (result == true) {
              // Exemplo: Recarregar dados, mostrar snackbar, etc
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ponto atualizado com sucesso!')),
              );
              // Aqui você pode fazer setState para atualizar UI ou fazer refresh se necessário
            }
          },
        )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (interestPoint.fotos.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                interestPoint.fotos.first,
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
            InfoRow(label: "Latitude", value: interestPoint.lat?.toString()),
            InfoRow(label: "Longitude", value: interestPoint.lon?.toString()),

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
              "Elementos Relacionados",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 300, // altura fixa pra evitar conflito de scroll
              child: ElementListViewApi(parentId: interestPoint.objectId ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String? value;

  const InfoRow({super.key, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value!)),
        ],
      ),
    );
  }
}
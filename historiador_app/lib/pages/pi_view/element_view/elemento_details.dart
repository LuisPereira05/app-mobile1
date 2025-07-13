import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../../../db/isar/elemento_pi.dart';
import 'package:pracashistoriador/pages/pi_view/element_view/edit_elemento.dart';

class ElementoDetailsPage extends StatelessWidget {
  final ElementoPI elemento;

  const ElementoDetailsPage({super.key, required this.elemento});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> camposPersonalizados = elemento.personalizados != null
        ? jsonDecode(elemento.personalizados!)
        : {};

    return Scaffold(
      appBar: AppBar(
        title: Text(elemento.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Editar Ponto',
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ElementoPIEditFormPageLocal(elemento: elemento),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImagem(),
            const SizedBox(height: 16),
            _buildInfoRow('Nome', elemento.name),
            _buildInfoRow('Tipo', elemento.tipo),
            _buildInfoRow('Descrição', elemento.description),
            _buildInfoRow('Latitude', elemento.lat.toStringAsFixed(6)),
            _buildInfoRow('Longitude', elemento.lon.toStringAsFixed(6)),
            _buildInfoRow('Autor', elemento.idAuthor),
            _buildInfoRow('Criado em', elemento.createdAt.toString()),
            _buildInfoRow('Atualizado em', elemento.updatedAt.toString()),

            const Divider(height: 32),
            const Text(
              'Campos Opcionais',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildOptionalRow('Histórico', elemento.historico),
            _buildOptionalRow('Acessibilidade', elemento.acessibilidade),
            _buildOptionalRow('Horário de Funcionamento', elemento.horarioFuncionamento),
            _buildOptionalRow('Imagens Extras', elemento.imagensExtra),
            _buildOptionalRow('Links Úteis', elemento.linksUteis),

            if (camposPersonalizados.isNotEmpty) ...[
              const Divider(height: 32),
              const Text(
                'Campos Personalizados',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (var entry in camposPersonalizados.entries)
                _buildOptionalRow(entry.key, entry.value?.toString()),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildImagem() {
    if (elemento.photos.isNotEmpty && File(elemento.photos.first).existsSync()) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          File(elemento.photos.first),
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Icon(Icons.image_not_supported, size: 40),
        ),
      );
    }
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildOptionalRow(String label, String? value) {
    if (value == null || value.trim().isEmpty) return const SizedBox.shrink();
    return _buildInfoRow(label, value);
  }
}
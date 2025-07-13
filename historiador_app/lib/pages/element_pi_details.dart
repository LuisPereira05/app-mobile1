import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pracashistoriador/mongo/elemento_pi.dart';
import 'editar_elemento.dart';

class ElementoDetailsApiPage extends StatelessWidget {
  final ElementoPI elemento;

  const ElementoDetailsApiPage({super.key, required this.elemento});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> camposPersonalizados = elemento.personalizados != null
        ? jsonDecode(elemento.personalizados!)
        : {};

    return Scaffold(
      appBar: AppBar(
        title: Text(elemento.name ?? 'Detalhes do Elemento'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Editar Ponto',
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ElementoPIEditFormPage(elemento: elemento),
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
            _buildInfoRow('Descrição', elemento.descripcion),
            _buildInfoRow('Latitude', elemento.lat.toString()),
            _buildInfoRow('Longitude', elemento.lon.toString()),
            _buildInfoRow('Autor', elemento.idAuthor),
            _buildInfoRow('Criado em', _formatDate(elemento.createdAt)),
            _buildInfoRow('Atualizado em', _formatDate(elemento.updatedAt)),

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
    if (elemento.photos != null && elemento.photos!.isNotEmpty && elemento.photos!.first.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          elemento.photos!.first,
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey.shade300,
            child: const Center(
              child: Icon(Icons.broken_image, size: 40),
            ),
          ),
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

  Widget _buildInfoRow(String label, String? value) {
    if (value == null || value.trim().isEmpty) return const SizedBox.shrink();
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

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2,'0')}/${date.month.toString().padLeft(2,'0')}/${date.year} ${date.hour.toString().padLeft(2,'0')}:${date.minute.toString().padLeft(2,'0')}';
  }
}

// Widget reutilizável do formulário
import 'package:flutter/material.dart';

class PontoInteresseFormWidget extends StatelessWidget {
  final bool exibirCampoVinculo;
  final List<String> pontosDisponiveis;
  final String? pontoSelecionado;
  final void Function(String?)? onSelecionarPonto;

  final TextEditingController nomeController;
  final TextEditingController tipoController;
  final TextEditingController bairroController;
  final TextEditingController enderecoController;
  final TextEditingController descricaoController;

  final VoidCallback onObterLocalizacao;
  final VoidCallback onAdicionarCampoOpcional;
  final VoidCallback onSalvar;

  const PontoInteresseFormWidget({
    super.key,
    required this.exibirCampoVinculo,
    required this.pontosDisponiveis,
    required this.pontoSelecionado,
    required this.onSelecionarPonto,
    required this.nomeController,
    required this.tipoController,
    required this.bairroController,
    required this.enderecoController,
    required this.descricaoController,
    required this.onObterLocalizacao,
    required this.onAdicionarCampoOpcional,
    required this.onSalvar,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey[300],
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.camera_alt, size: 48),
                  SizedBox(height: 8),
                  Text('Tirar Foto'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Campos obrigatórios', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          if (exibirCampoVinculo)
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Ponto de Interesse'),
              value: pontoSelecionado,
              items: pontosDisponiveis.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
              onChanged: onSelecionarPonto,
            ),

          TextField(
            controller: nomeController,
            decoration: const InputDecoration(labelText: 'Nome'),
          ),
          TextField(
            controller: tipoController,
            decoration: const InputDecoration(labelText: 'Tipo'),
          ),
          TextField(
            controller: bairroController,
            decoration: const InputDecoration(labelText: 'Bairro'),
          ),
          TextField(
            controller: enderecoController,
            decoration: const InputDecoration(labelText: 'Endereço'),
          ),
          TextField(
            controller: descricaoController,
            decoration: const InputDecoration(labelText: 'Descrição'),
          ),
          const SizedBox(height: 16),

          ElevatedButton.icon(
            onPressed: onObterLocalizacao,
            icon: const Icon(Icons.location_on_outlined),
            label: const Text('Obter Localização'),
          ),

          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Campos opcionais', style: TextStyle(fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onAdicionarCampoOpcional,
              ),
            ],
          ),

          const SizedBox(height: 32),
          Center(
            child: ElevatedButton.icon(
              onPressed: onSalvar,
              icon: const Icon(Icons.save),
              label: const Text('Salvar'),
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
            ),
          ),
        ],
      ),
    );
  }
}

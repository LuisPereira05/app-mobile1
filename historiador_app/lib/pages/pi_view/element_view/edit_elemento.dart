import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:geolocator/geolocator.dart';

import 'package:pracashistoriador/db/isar/elemento_pi.dart';
import 'package:pracashistoriador/db/isar/isar_service.dart';
import 'package:pracashistoriador/pages/mapa_selecao_page.dart';

class ElementoPIEditFormPageLocal extends StatefulWidget {
  final ElementoPI elemento;

  const ElementoPIEditFormPageLocal({super.key, required this.elemento});

  @override
  State<ElementoPIEditFormPageLocal> createState() =>
      _ElementoPIEditFormPageLocalState();
}

class _ElementoPIEditFormPageLocalState extends State<ElementoPIEditFormPageLocal> {
  late TextEditingController nomeController;
  late TextEditingController tipoController;
  late TextEditingController descricaoController;

  final Map<String, TextEditingController> camposOpcionais = {
    'Histórico': TextEditingController(),
    'Acessibilidade': TextEditingController(),
    'Horário de Funcionamento': TextEditingController(),
    'Imagens (URL ou nome do arquivo)': TextEditingController(),
    'Links Úteis': TextEditingController(),
  };

  final Set<String> camposVisiveis = {};
  final Map<String, TextEditingController> camposPersonalizados = {};

  XFile? imagemCapturada;
  double? latitude;
  double? longitude;

  final isarService = IsarService();

  @override
  void initState() {
    super.initState();
    final el = widget.elemento;

    nomeController = TextEditingController(text: el.name);
    tipoController = TextEditingController(text: el.tipo);
    descricaoController = TextEditingController(text: el.description);

    latitude = el.lat;
    longitude = el.lon;

    if (el.historico != null) {
      camposOpcionais['Histórico']!.text = el.historico!;
      camposVisiveis.add('Histórico');
    }
    if (el.acessibilidade != null) {
      camposOpcionais['Acessibilidade']!.text = el.acessibilidade!;
      camposVisiveis.add('Acessibilidade');
    }
    if (el.horarioFuncionamento != null) {
      camposOpcionais['Horário de Funcionamento']!.text = el.horarioFuncionamento!;
      camposVisiveis.add('Horário de Funcionamento');
    }
    if (el.imagensExtra != null) {
      camposOpcionais['Imagens (URL ou nome do arquivo)']!.text = el.imagensExtra!;
      camposVisiveis.add('Imagens (URL ou nome do arquivo)');
    }
    if (el.linksUteis != null) {
      camposOpcionais['Links Úteis']!.text = el.linksUteis!;
      camposVisiveis.add('Links Úteis');
    }

    if (el.personalizados != null) {
      final Map<String, dynamic> map = jsonDecode(el.personalizados!);
      map.forEach((key, value) {
        camposPersonalizados[key] = TextEditingController(text: value.toString());
      });
    }

    if (el.photos.isNotEmpty) {
      imagemCapturada = XFile(el.photos.first);
    }
  }

  Future<void> _obterLocalizacao() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) return;
    }

    final pos = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = pos.latitude;
      longitude = pos.longitude;
    });
  }

  void _mostrarEscolhaLocalizacao() async {
    final escolha = await showModalBottomSheet<String>(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.my_location),
            title: const Text('Usar localização atual'),
            onTap: () => Navigator.pop(context, 'atual'),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Selecionar no mapa'),
            onTap: () => Navigator.pop(context, 'mapa'),
          ),
        ],
      ),
    );

    if (escolha == 'atual') {
      _obterLocalizacao();
    } else if (escolha == 'mapa') {
      final resultado = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const MapaSelecaoPage()),
      );
      if (resultado != null && resultado is Map<String, double>) {
        setState(() {
          latitude = resultado['lat'];
          longitude = resultado['lng'];
        });
      }
    }
  }

  void _adicionarCampoOpcional() async {
    final opcoes = camposOpcionais.keys.where((c) => !camposVisiveis.contains(c)).toList();

    final campoSelecionado = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Adicionar campo opcional'),
        children: [
          ...opcoes.map((campo) => SimpleDialogOption(
                onPressed: () => Navigator.pop(context, campo),
                child: Text(campo),
              )),
          const Divider(),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'Campo Personalizado'),
            child: const Text('➕ Campo Personalizado'),
          ),
        ],
      ),
    );

    if (campoSelecionado != null) {
      if (campoSelecionado == 'Campo Personalizado') {
        final nomeCampo = await showDialog<String>(
          context: context,
          builder: (context) {
            final controller = TextEditingController();
            return AlertDialog(
              title: const Text('Campo Personalizado'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: 'Nome do campo'),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      Navigator.pop(context, controller.text.trim());
                    }
                  },
                  child: const Text('Adicionar'),
                ),
              ],
            );
          },
        );
        if (nomeCampo != null) {
          setState(() {
            camposPersonalizados[nomeCampo] = TextEditingController();
          });
        }
      } else {
        setState(() {
          camposVisiveis.add(campoSelecionado);
        });
      }
    }
  }

  Future<void> tirarFoto() async {
    final picker = ImagePicker();
    final XFile? imagem = await picker.pickImage(source: ImageSource.camera);

    if (imagem != null) {
      final dir = Directory('/storage/emulated/0/DCIM/UH-Historiador');
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }
      final String newPath = path.join(dir.path, path.basename(imagem.path));
      final File savedImage = await File(imagem.path).copy(newPath);

      setState(() {
        imagemCapturada = XFile(savedImage.path);
      });
    }
  }

  void atualizarElemento() async {
    final nome = nomeController.text.trim();
    final tipo = tipoController.text.trim();
    final descricao = descricaoController.text.trim();

    if (nome.isEmpty || tipo.isEmpty || descricao.isEmpty || latitude == null || longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos obrigatórios')),
      );
      return;
    }

    final el = widget.elemento;

    el.name = nome;
    el.tipo = tipo;
    el.description = descricao;
    el.lat = latitude!;
    el.lon = longitude!;
    el.updatedAt = DateTime.now();
    el.photos = imagemCapturada != null ? [imagemCapturada!.path] : el.photos;


    // Opcionais
    el.historico = camposOpcionais['Histórico']?.text.trim().isNotEmpty == true
        ? camposOpcionais['Histórico']!.text.trim()
        : null;
    el.acessibilidade = camposOpcionais['Acessibilidade']?.text.trim().isNotEmpty == true
        ? camposOpcionais['Acessibilidade']!.text.trim()
        : null;
    el.horarioFuncionamento = camposOpcionais['Horário de Funcionamento']?.text.trim().isNotEmpty == true
        ? camposOpcionais['Horário de Funcionamento']!.text.trim()
        : null;
    el.imagensExtra = camposOpcionais['Imagens (URL ou nome do arquivo)']?.text.trim().isNotEmpty == true
        ? camposOpcionais['Imagens (URL ou nome do arquivo)']!.text.trim()
        : null;
    el.linksUteis = camposOpcionais['Links Úteis']?.text.trim().isNotEmpty == true
        ? camposOpcionais['Links Úteis']!.text.trim()
        : null;

    final personalizadosMap = {
      for (var entry in camposPersonalizados.entries)
        if (entry.value.text.trim().isNotEmpty) entry.key: entry.value.text.trim(),
    };

    el.personalizados = personalizadosMap.isNotEmpty ? jsonEncode(personalizadosMap) : null;

    try {
      await isarService.updateElementoPI(el);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Elemento atualizado com sucesso!')),
      );
      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao atualizar: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Elemento')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: tirarFoto,
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
                image: imagemCapturada != null
                    ? DecorationImage(image: FileImage(File(imagemCapturada!.path)), fit: BoxFit.cover)
                    : null,
              ),
              child: imagemCapturada == null
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, size: 40),
                          SizedBox(height: 8),
                          Text('Tirar Foto'),
                        ],
                      ),
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          const Text('Campos obrigatórios', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextField(controller: nomeController, decoration: const InputDecoration(labelText: 'Nome')),
          DropdownButtonFormField<String>(
            value: tipoController.text.isNotEmpty ? tipoController.text : null,
            decoration: const InputDecoration(labelText: 'Tipo'),
            items: ['Escultura', 'Fonte', 'Placa histórica', 'Memorial', 'Obra moderna'].map((tipo) {
              return DropdownMenuItem<String>(value: tipo, child: Text(tipo));
            }).toList(),
            onChanged: (value) => setState(() => tipoController.text = value!),
          ),
          TextField(controller: descricaoController, decoration: const InputDecoration(labelText: 'Descrição')),
          const SizedBox(height: 8),
          Center(
            child: ElevatedButton.icon(
              onPressed: _mostrarEscolhaLocalizacao,
              icon: const Icon(Icons.gps_fixed),
              label: const Text('Obter Localização'),
            ),
          ),
          if (latitude != null && longitude != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('Latitude: $latitude, Longitude: $longitude'),
            ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Campos opcionais', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(icon: const Icon(Icons.add), onPressed: _adicionarCampoOpcional),
            ],
          ),
          for (final campo in camposVisiveis)
            TextField(controller: camposOpcionais[campo], decoration: InputDecoration(labelText: campo)),
          const SizedBox(height: 24),
          for (final entry in camposPersonalizados.entries)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(controller: entry.value, decoration: InputDecoration(labelText: entry.key)),
            ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              onPressed: atualizarElemento,
              icon: const Icon(Icons.save),
              label: const Text('Atualizar Elemento'),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    tipoController.dispose();
    descricaoController.dispose();
    for (var ctrl in camposOpcionais.values) {
      ctrl.dispose();
    }
    for (var ctrl in camposPersonalizados.values) {
      ctrl.dispose();
    }
    super.dispose();
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:pracashistoriador/api/auth_service.dart';
import 'package:pracashistoriador/mongo/elemento_pi.dart';
import 'package:pracashistoriador/pages/mapa_selecao_page.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

class ElementoPIEditFormPage extends StatefulWidget {
  final ElementoPI elemento;

  const ElementoPIEditFormPage({super.key, required this.elemento});

  @override
  State<ElementoPIEditFormPage> createState() => _ElementoPIEditFormPageState();
}

class _ElementoPIEditFormPageState extends State<ElementoPIEditFormPage> {
  late TextEditingController nomeController;
  late TextEditingController tipoController;
  late TextEditingController descricaoController;

  late Map<String, TextEditingController> camposPersonalizados;
  late Map<String, dynamic> personalizadosMap;

  XFile? imagemCapturada;
  double? latitude;
  double? longitude;

  final camposOpcionais = {
    'Histórico': TextEditingController(),
    'Acessibilidade': TextEditingController(),
    'Horário de Funcionamento': TextEditingController(),
    'Imagens Extras': TextEditingController(),
    'Links Úteis': TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    final el = widget.elemento;

    nomeController = TextEditingController(text: el.name);
    tipoController = TextEditingController(text: el.tipo ?? '');
    descricaoController = TextEditingController(text: el.descripcion ?? '');
    latitude = el.lat;
    longitude = el.lon;

    camposOpcionais['Histórico']!.text = el.historico ?? '';
    camposOpcionais['Acessibilidade']!.text = el.acessibilidade ?? '';
    camposOpcionais['Horário de Funcionamento']!.text = el.horarioFuncionamento ?? '';
    camposOpcionais['Imagens Extras']!.text = el.imagensExtra ?? '';
    camposOpcionais['Links Úteis']!.text = el.linksUteis ?? '';

    try {
      personalizadosMap = el.personalizados != null ? jsonDecode(el.personalizados!) : {};
    } catch (_) {
      personalizadosMap = {};
    }

    camposPersonalizados = {
      for (var entry in personalizadosMap.entries)
        entry.key: TextEditingController(text: entry.value.toString()),
    };
  }

  Future<void> _tirarFoto() async {
    final picker = ImagePicker();
    final foto = await picker.pickImage(source: ImageSource.camera);
    if (foto != null) {
      setState(() => imagemCapturada = foto);
    }
  }

  Future<void> _mostrarEscolhaLocalizacao() async {
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
      final pos = await Geolocator.getCurrentPosition();
      setState(() {
        latitude = pos.latitude;
        longitude = pos.longitude;
      });
    } else if (escolha == 'mapa') {
      final resultado = await Navigator.push(context,
        MaterialPageRoute(builder: (_) => const MapaSelecaoPage()));
      if (resultado != null && resultado is Map<String, double>) {
        setState(() {
          latitude = resultado['lat'];
          longitude = resultado['lng'];
        });
      }
    }
  }

  void _adicionarCampoPersonalizado() async {
    final nome = await showDialog<String>(
      context: context,
      builder: (context) {
        final ctrl = TextEditingController();
        return AlertDialog(
          title: const Text('Campo Personalizado'),
          content: TextField(controller: ctrl, decoration: const InputDecoration(labelText: 'Nome')),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
            ElevatedButton(onPressed: () {
              if (ctrl.text.trim().isNotEmpty) Navigator.pop(context, ctrl.text.trim());
            }, child: const Text('Adicionar')),
          ],
        );
      },
    );

    if (nome != null && !camposPersonalizados.containsKey(nome)) {
      setState(() {
        camposPersonalizados[nome] = TextEditingController();
      });
    }
  }

  Future<void> _atualizarElemento() async {
    final auth = Provider.of<AuthService>(context, listen: false);
    final token = auth.token;
    final baseUrl = auth.baseUrl;

    print("------------------------------- TENTANDO ATUALIZAR COM O TOKEN: $token");

    final nome = nomeController.text.trim();
    final tipo = tipoController.text.trim();
    final descricao = descricaoController.text.trim();

    if (nome.isEmpty || tipo.isEmpty || descricao.isEmpty || latitude == null || longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos obrigatórios')),
      );
      return;
    }

    final personalizados = {
      for (var e in camposPersonalizados.entries) e.key: e.value.text.trim()
    };

    final fotos = imagemCapturada != null
        ? [imagemCapturada!.path]
        : widget.elemento.photos;

    final atualizado = ElementoPI(
      objectId: widget.elemento.objectId,
      parentId: widget.elemento.parentId,
      name: nome,
      tipo: tipo,
      descripcion: descricao,
      lat: latitude!,
      lon: longitude!,
      createdAt: widget.elemento.createdAt,
      updatedAt: DateTime.now(),
      personalizados: personalizados.isNotEmpty ? jsonEncode(personalizados) : null,
      idAuthor: widget.elemento.idAuthor,
      photos: fotos,
      historico: camposOpcionais['Histórico']!.text.trim(),
      acessibilidade: camposOpcionais['Acessibilidade']!.text.trim(),
      horarioFuncionamento: camposOpcionais['Horário de Funcionamento']!.text.trim(),
      imagensExtra: camposOpcionais['Imagens Extras']!.text.trim(),
      linksUteis: camposOpcionais['Links Úteis']!.text.trim(),
    );

    try {
      final res = await http.put(
        Uri.parse('$baseUrl/api/elements/${atualizado.objectId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode({
          'parentId': atualizado.parentId,
          'name': atualizado.name,
          'tipo': atualizado.tipo,
          'descripcion': atualizado.descripcion,
          'lat': atualizado.lat,
          'lon': atualizado.lon,
          'createdAt': atualizado.createdAt.toIso8601String(),
          'updatedAt': atualizado.updatedAt.toIso8601String(),
          'personalizados': atualizado.personalizados,
          'idAuthor': atualizado.idAuthor,
          'photos': atualizado.photos,
          'historico': atualizado.historico,
          'acessibilidade': atualizado.acessibilidade,
          'horarioFuncionamento': atualizado.horarioFuncionamento,
          'imagensExtra': atualizado.imagensExtra,
          'linksUteis': atualizado.linksUteis,
        }),
      );

      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Elemento atualizado!')));
        Navigator.pop(context, true);
      } else {
        throw Exception('Erro: ${res.statusCode}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao salvar: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Elemento')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          GestureDetector(
            onTap: _tirarFoto,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
                image: imagemCapturada != null
                    ? DecorationImage(image: FileImage(File(imagemCapturada!.path)), fit: BoxFit.cover)
                    : (widget.elemento.photos.isNotEmpty
                        ? DecorationImage(image: NetworkImage(widget.elemento.photos.first), fit: BoxFit.cover)
                        : null),
              ),
              child: (imagemCapturada == null && widget.elemento.photos.isEmpty)
                  ? const Center(child: Icon(Icons.camera_alt, size: 40))
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          TextField(controller: nomeController, decoration: const InputDecoration(labelText: 'Nome')),
          TextField(controller: tipoController, decoration: const InputDecoration(labelText: 'Tipo')),
          TextField(controller: descricaoController, decoration: const InputDecoration(labelText: 'Descrição')),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: _mostrarEscolhaLocalizacao,
            icon: const Icon(Icons.location_on),
            label: const Text('Definir Localização'),
          ),
          if (latitude != null && longitude != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('Latitude: $latitude, Longitude: $longitude'),
            ),
          const Divider(height: 32),
          const Text('Campos opcionais', style: TextStyle(fontWeight: FontWeight.bold)),
          for (final entry in camposOpcionais.entries)
            TextField(controller: entry.value, decoration: InputDecoration(labelText: entry.key)),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Campos personalizados', style: TextStyle(fontWeight: FontWeight.bold)),
              IconButton(onPressed: _adicionarCampoPersonalizado, icon: const Icon(Icons.add)),
            ],
          ),
          for (final entry in camposPersonalizados.entries)
            TextField(controller: entry.value, decoration: InputDecoration(labelText: entry.key)),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _atualizarElemento,
            icon: const Icon(Icons.save),
            label: const Text('Salvar Alterações'),
          ),
        ]),
      ),
    );
  }
}

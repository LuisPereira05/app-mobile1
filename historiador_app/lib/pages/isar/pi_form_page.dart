import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart' as path;
import 'package:pracashistoriador/pages/mapa_selecao_page.dart';

import '../../db/isar/isar_service.dart';
import '../../db/isar/interest_point.dart';

class PIFormPage extends StatefulWidget {
  final String token;
  final String baseUrl;

  const PIFormPage({super.key, required this.token, required this.baseUrl});

  @override
  State<PIFormPage> createState() => _PIFormPageState();
}

class _PIFormPageState extends State<PIFormPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  String? authorId;

  

  double? latitude;
  double? longitude;
  XFile? imagemCapturada;

  final Map<String, TextEditingController> camposOpcionais = {
    'Histórico': TextEditingController(),
    'Acessibilidade': TextEditingController(),
    'Horário de Funcionamento': TextEditingController(),
    'Imagens (URL ou nome do arquivo)': TextEditingController(),
    'Links Úteis': TextEditingController(),
  };

  final Set<String> camposVisiveis = {};
  final Map<String, TextEditingController> camposPersonalizados = {};

  Future<void> _fetchAuthor() async {
    final url = Uri.parse(widget.baseUrl + '/api/users/me');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
      );

      final jsonData = jsonDecode(response.body);
      setState(() {
        authorId = jsonData['_id'];
      });
      

      print('-------------------BODY:' + response.body);
      print('-------------------AUTHOR ID: ' + authorId!);
    } catch (e) {
      print("-------------------ERRO> " + e.toString());
    }
  }

  void _obterLocalizacao() async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      LocationPermission permission = await Geolocator.checkPermission();

      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return;
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          return;
        }
      }

      final pos = await Geolocator.getCurrentPosition();
      setState(() {
        latitude = pos.latitude;
        longitude = pos.longitude;
      });
  }

  Future<void> tirarFoto() async {
    final picker = ImagePicker();
    final XFile? imagem = await picker.pickImage(source: ImageSource.camera);

    if (imagem != null) {
      // Define your custom directory
      final Directory targetDir = Directory('/storage/emulated/0/DCIM/UH-Historiador');

      // Ensure the directory exists
      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }

      // Define the new file path (preserve original filename)
      final String newPath = path.join(targetDir.path, path.basename(imagem.path));

      // Move the file
      final File savedImage = await File(imagem.path).copy(newPath);

      setState(() {
        imagemCapturada = XFile(savedImage.path);
      });

      print("---------------------------------Foto salva em: ${savedImage.path}");
    }
  }

  void _mostrarEscolhaLocalizacao(BuildContext context) async {
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
          SizedBox(height: 32,)
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
      if (resultado != null && resultado is Map<String, String>) {
        setState(() {
          latitude = double.parse(resultado['lat']!);
          longitude = double.parse(resultado['lng']!);
        });
      }
    }
  }

  void _adicionarCampoPersonalizado() async {
    final nomeCampo = await showDialog<String>(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Adicionar campo personalizado'),
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

    if (nomeCampo != null && !camposPersonalizados.containsKey(nomeCampo)) {
      setState(() {
        camposPersonalizados[nomeCampo] = TextEditingController();
      });
    }
  }

  void _adicionarCampoOpcional() async {
    final opcoes = camposOpcionais.keys
        .where((c) => !camposVisiveis.contains(c))
        .toList();

    final campoSelecionado = await showDialog<String>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Adicionar campo opcional'),
          children: [
            ...opcoes.map((campo) {
              return SimpleDialogOption(
                onPressed: () => Navigator.pop(context, campo),
                child: Text(campo),
              );
            }),
            const Divider(),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'Campo Personalizado'),
              child: const Text('➕ Campo Personalizado'),
            ),
          ],
        );
      },
    );

    if (campoSelecionado != null) {
      if (campoSelecionado == 'Campo Personalizado') {
        _adicionarCampoPersonalizado();
      } else {
        setState(() {
          camposVisiveis.add(campoSelecionado);
        });
      }
    }
  }

  Widget _buildCampoPersonalizado(
    String nome,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: nome),
      ),
    );
  }

  Future<void> salvarPonto() async {
    await _fetchAuthor();
    final nome = nomeController.text;
    final tipo = tipoController.text;
    final bairro = bairroController.text;
    final endereco = enderecoController.text;
    final descricao = descricaoController.text;

    print('----------------AUTHOR ID (salvar): ' + authorId!);

    if (nome.isEmpty ||
        tipo.isEmpty ||
        bairro.isEmpty ||
        endereco.isEmpty ||
        descricao.isEmpty ||
        latitude == null ||
        longitude == null ||
        authorId == null)  {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos obrigatórios')),
      );
      return;
    }

    // Convertendo campos opcionais
    final dadosOpcionais = {
      for (var campo in camposVisiveis)
        campo: camposOpcionais[campo]?.text ?? '',
    };

    // Convertendo campos personalizados
    final dadosPersonalizados = {
      for (var campo in camposPersonalizados.entries)
        campo.key: campo.value.text,
    };

    final interestPoint = InterestPoint()
      ..name = nome
      ..tipo = tipo
      ..bairro = bairro
      ..endereco = endereco
      ..descripcion = descricao
      ..idAuthor = authorId!
      ..lat = latitude!
      ..lon = longitude!
      ..fotos = imagemCapturada != null ? [imagemCapturada!.path] : []
      ..personalizados = jsonEncode({
        ...dadosOpcionais,
        ...dadosPersonalizados,
      })
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    try {
      await IsarService().addInterestPoint(interestPoint);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ponto salvo localmente com sucesso!')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar no Isar: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("\n\n\n\t\t FORMULARIO ISAR");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Ponto de Interesse (Isar)'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: tirarFoto,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                  image: imagemCapturada != null
                      ? DecorationImage(
                          image: FileImage(File(imagemCapturada!.path)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: imagemCapturada == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.camera_alt, size: 40, color: Colors.black54),
                            SizedBox(height: 8),
                            Text('Tirar Foto', style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Campos obrigatórios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            DropdownButtonFormField<String>(
              value: tipoController.text.isNotEmpty ? tipoController.text : null,
              decoration: const InputDecoration(labelText: 'Tipo'),
              items: [
                'Patrimônio histórico',
                'Atrativo turístico natural',
                'Cultural',
                'Religioso',
                'Comercial tradicional',
              ].map((tipo) {
                return DropdownMenuItem<String>(
                  value: tipo,
                  child: Text(tipo),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  tipoController.text = value!;
                });
              },
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
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _mostrarEscolhaLocalizacao(context),
                icon: const Icon(Icons.location_on),
                label: const Text('Escolher Localização'),
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
                const Text(
                  'Campos opcionais',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _adicionarCampoOpcional,
                  tooltip: 'Adicionar campo opcional',
                ),
              ],
            ),
            for (final campo in camposVisiveis)
              TextField(
                controller: camposOpcionais[campo],
                decoration: InputDecoration(labelText: campo),
              ),
            const SizedBox(height: 24),
            for (final entry in camposPersonalizados.entries)
              _buildCampoPersonalizado(entry.key, entry.value),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: salvarPonto,
                child: const Text('Salvar Ponto'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
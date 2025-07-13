import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:pracashistoriador/api/auth_service.dart';
import 'package:pracashistoriador/mongo/interest_point.dart';
import 'package:pracashistoriador/pages/mapa_selecao_page.dart';
import 'package:provider/provider.dart';



class PIEditFormPage extends StatefulWidget {
  final InterestPoint interestPoint;

  const PIEditFormPage({
    super.key,
    required this.interestPoint,
  });

  @override
  State<PIEditFormPage> createState() => _PIEditFormPageState();
}

class _PIEditFormPageState extends State<PIEditFormPage> {
  late TextEditingController nomeController;
  late TextEditingController tipoController;
  late TextEditingController bairroController;
  late TextEditingController enderecoController;
  late TextEditingController descricaoController;

  double? latitude;
  double? longitude;
  XFile? imagemCapturada;

  late Map<String, TextEditingController> camposPersonalizados;
  late Map<String, dynamic> personalizadosMap;

  @override
  void initState() {
    super.initState();

    final ip = widget.interestPoint;

    nomeController = TextEditingController(text: ip.name);
    tipoController = TextEditingController(text: ip.tipo ?? '');
    bairroController = TextEditingController(text: ip.bairro ?? '');
    enderecoController = TextEditingController(text: ip.endereco ?? '');
    descricaoController = TextEditingController(text: ip.descripcion ?? '');

    latitude = ip.lat;
    longitude = ip.lon;

    // Inicializar mapa personalizado
    personalizadosMap = {};
    try {
      personalizadosMap = ip.personalizados != null
          ? jsonDecode(ip.personalizados!)
          : {};
    } catch (_) {
      personalizadosMap = {};
    }

    camposPersonalizados = {
      for (var entry in personalizadosMap.entries)
        entry.key: TextEditingController(text: entry.value.toString()),
    };

    // Se já tem alguma foto, podemos mostrar a primeira (url) 
    if (ip.fotos.isNotEmpty) {
      // Só armazenar a url, a imagem local pode ser capturada pelo usuário.
      imagemCapturada = null;
    }
  }

  Future<void> tirarFoto() async {
    final picker = ImagePicker();
    final XFile? imagem = await picker.pickImage(source: ImageSource.camera);

    if (imagem != null) {
      // Copiar a imagem para app directory (opcional)
      setState(() {
        imagemCapturada = imagem;
      });
    }
  }

  Future<void> _mostrarEscolhaLocalizacao(BuildContext context) async {
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
          SizedBox(height: 16,)
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

  Widget _buildCampoPersonalizado(String nome, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: nome),
      ),
    );
  }

  Future<void> atualizarPonto() async {
    final auth = Provider.of<AuthService>(context, listen: false);
    final token = auth.token;
    final baseUrl = auth.baseUrl;

    print("----------------------- ATUALIZANDO COM TOKEN: " + token!);

    final nome = nomeController.text.trim();
    final tipo = tipoController.text.trim();
    final bairro = bairroController.text.trim();
    final endereco = enderecoController.text.trim();
    final descricao = descricaoController.text.trim();

    if (nome.isEmpty ||
        tipo.isEmpty ||
        bairro.isEmpty ||
        endereco.isEmpty ||
        descricao.isEmpty ||
        latitude == null ||
        longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos obrigatórios')),
      );
      return;
    }

    // Preparar personalizados
    final Map<String, dynamic> personalizadosJson = {
      for (var entry in camposPersonalizados.entries) entry.key: entry.value.text,
    };

    // Preparar lista de fotos
    List<String> fotosAtualizadas = widget.interestPoint.fotos;
    if (imagemCapturada != null) {
      // Se quiser, pode subir para o servidor aqui e obter URL real.
      // Por enquanto vamos só usar o caminho local (para demo).
      fotosAtualizadas = [imagemCapturada!.path];
    }

    final atualizado = InterestPoint(
      objectId: widget.interestPoint.objectId,
      name: nome,
      tipo: tipo,
      bairro: bairro,
      endereco: endereco,
      descripcion: descricao,
      lat: latitude!,
      lon: longitude!,
      createdAt: widget.interestPoint.createdAt,
      updatedAt: DateTime.now(),
      contact: widget.interestPoint.contact,
      hour: widget.interestPoint.hour,
      personalizados: jsonEncode(personalizadosJson),
      fotos: fotosAtualizadas,
      elementos: widget.interestPoint.elementos,
      author: widget.interestPoint.author,
    );

    try {
      final response = await http.put(
        Uri.parse('${baseUrl}/api/interest-points/${atualizado.objectId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode({
          'name': atualizado.name,
          'tipo': atualizado.tipo,
          'bairro': atualizado.bairro,
          'endereco': atualizado.endereco,
          'descripcion': atualizado.descripcion,
          'lat': atualizado.lat,
          'lon': atualizado.lon,
          'createdAt': atualizado.createdAt.toIso8601String(),
          'updatedAt': atualizado.updatedAt.toIso8601String(),
          'contato': atualizado.contact,
          'hour': atualizado.hour,
          'personalizados': atualizado.personalizados,
          'fotos': atualizado.fotos,
          'elementos': atualizado.elementos,
          'idAuthor': atualizado.author,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ponto atualizado com sucesso!')),
        );
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro na requisição: $e')),
      );
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    tipoController.dispose();
    bairroController.dispose();
    enderecoController.dispose();
    descricaoController.dispose();
    for (var ctrl in camposPersonalizados.values) {
      ctrl.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Ponto de Interesse'),
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
                      : (widget.interestPoint.fotos.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(widget.interestPoint.fotos.first),
                              fit: BoxFit.cover,
                            )
                          : null),
                ),
                child: (imagemCapturada == null && widget.interestPoint.fotos.isEmpty)
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
            const Text('Campos obrigatórios', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                  tipoController.text = value ?? '';
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
                const Text('Campos personalizados', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _adicionarCampoPersonalizado,
                  tooltip: 'Adicionar campo personalizado',
                ),
              ],
            ),
            ...camposPersonalizados.entries
                .map((e) => _buildCampoPersonalizado(e.key, e.value))
                .toList(),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: atualizarPonto,
                child: const Text('Atualizar Ponto'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

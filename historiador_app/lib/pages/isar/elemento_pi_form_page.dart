import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:isar/isar.dart';
import 'package:pracashistoriador/pages/mapa_selecao_page.dart';
import '../../db/isar/isar_service.dart';
import '../../db/isar/elemento_pi.dart';
import '../../db/isar/interest_point.dart';

class ElementoPIFormPage extends StatefulWidget {
  final Function(ElementoPI) onSave;
  final String token; // <-- ADICIONADO
  final String baseUrl;
  
  
  

  const ElementoPIFormPage({
    super.key,
    required this.onSave,
    required this.token, // ✅ Adicionado
    required this.baseUrl
  });

  @override
  State<ElementoPIFormPage> createState() => _ElementoPIFormPageState();
}

class _ElementoPIFormPageState extends State<ElementoPIFormPage> {
  String? authorId;
  
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

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
  List<InterestPoint>? interestPoints;
  List<String> interestPointNames = [];
  String? pontoInteresseSelecionado;

  
  @override
  void initState() {
    super.initState();
    _carregarInterestPoints();
  }


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


  Future<void> _carregarInterestPoints() async {
    final pontos = await IsarService().getAllInterestPoints();

    setState(() {
      interestPoints = pontos;
      interestPointNames = pontos.map((p) => p.name).toList();
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
        ],
      ),
    );

    if (escolha == 'atual') {
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

  void adicionarCampoOpcional() async {
    final opcoes = camposOpcionais.keys
        .where((c) => !camposVisiveis.contains(c))
        .toList();

    final campoSelecionado = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Adicionar campo opcional'),
        children: [
          ...opcoes.map(
            (campo) => SimpleDialogOption(
              onPressed: () => Navigator.pop(context, campo),
              child: Text(campo),
            ),
          ),
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
        adicionarCampoPersonalizado();
      } else {
        setState(() {
          camposVisiveis.add(campoSelecionado);
        });
      }
    }
  }

  void adicionarCampoPersonalizado() async {
    
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

    if (nomeCampo != null && !camposPersonalizados.containsKey(nomeCampo)) {
      setState(() {
        camposPersonalizados[nomeCampo] = TextEditingController();
      });
    }
  }

  void salvarElemento() async {
    await _fetchAuthor();

    final dir = await getApplicationDocumentsDirectory();

    if (pontoInteresseSelecionado == null ||
        nomeController.text.isEmpty ||
        tipoController.text.isEmpty ||
        descricaoController.text.isEmpty ||
        latitude == null ||
        longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos obrigatórios')),
      );
      return;
    }

    print('----------------AUTHOR ID (salvar): ' + authorId!);

    final pi = await IsarService().getInterestPointByName(pontoInteresseSelecionado!);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text("Salvando elemento..."),
            ],
          ),
        );
      },
    );

    

    try {
      final elemento = ElementoPI()
        ..name = nomeController.text
        ..idAuthor = authorId!
        ..interestPointIsarId = pi!.id
        ..tipo = tipoController.text
        ..description = descricaoController.text
        ..photos = imagemCapturada != null ? [imagemCapturada!.path] : []
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..lat = latitude!
        ..lon = longitude!;

        // Agora adiciona os campos opcionais só se não forem nulos ou vazios:
        if (camposOpcionais['Histórico']?.text.trim().isNotEmpty ?? false) {
          elemento.historico = camposOpcionais['Histórico']!.text.trim();
        } else {
          elemento.historico = null;
        }

        if (camposOpcionais['Acessibilidade']?.text.trim().isNotEmpty ?? false) {
          elemento.acessibilidade = camposOpcionais['Acessibilidade']!.text.trim();
        } else {
          elemento.acessibilidade = null;
        }

        if (camposOpcionais['Horário de Funcionamento']?.text.trim().isNotEmpty ?? false) {
          elemento.horarioFuncionamento = camposOpcionais['Horário de Funcionamento']!.text.trim();
        } else {
          elemento.horarioFuncionamento = null;
        }

        if (camposOpcionais['Imagens (URL ou nome do arquivo)']?.text.trim().isNotEmpty ?? false) {
          elemento.imagensExtra = camposOpcionais['Imagens (URL ou nome do arquivo)']!.text.trim();
        } else {
          elemento.imagensExtra = null;
        }

        if (camposOpcionais['Links Úteis']?.text.trim().isNotEmpty ?? false) {
          elemento.linksUteis = camposOpcionais['Links Úteis']!.text.trim();
        } else {
          elemento.linksUteis = null;
        }

        // Para os campos personalizados, faça um Map<String, String> para armazenar os pares nome: valor
        final Map<String, String> personalizadosMap = {};

        camposPersonalizados.forEach((nomeCampo, controller) {
          if (controller.text.trim().isNotEmpty) {
            personalizadosMap[nomeCampo] = controller.text.trim();
          }
        });

        if (personalizadosMap.isNotEmpty) {
          elemento.personalizados = jsonEncode(personalizadosMap);
        } else {
          elemento.personalizados = null;
        }

      
      // Salva no Isar e pega o id retornado
      final elementoId = await IsarService().addElementoPI(elemento);

      // Atribui o id gerado ao objeto (modificando o objeto)
      elemento.id = elementoId;

      // Atualiza o interest point para adicionar o elemento
      

      List<Id> novaLista = List<Id>.from(pi.elementosIsar);
      novaLista.add(elementoId);
      pi.elementosIsar = novaLista;

      await IsarService().updateInterestPoint(pi);

      Navigator.pop(context); // Fecha diálogo de loading
      Navigator.pop(context); // Fecha tela de formulário

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${pi.name} atualizado com sucesso!')),
      );
            } catch (e) {
      Navigator.pop(context); // Fecha diálogo de loading
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ERRO AO SALVAR ELEMENTO: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Elemento'),
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
            const Text(
              'Campos obrigatórios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: pontoInteresseSelecionado,
              decoration: const InputDecoration(
                labelText: 'Ponto de Interesse',
              ),
              items: interestPointNames
                  .map((pi) => DropdownMenuItem(value: pi, child: Text(pi)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  pontoInteresseSelecionado = value;
                });
              },
            ),
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            DropdownButtonFormField<String>(
              value: tipoController.text.isNotEmpty
                  ? tipoController.text
                  : null,
              decoration: const InputDecoration(labelText: 'Tipo'),
              items:
                  [
                    'Escultura',
                    'Fonte',
                    'Placa histórica',
                    'Memorial',
                    'Obra moderna',
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
              controller: descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _mostrarEscolhaLocalizacao(context),
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
                const Text(
                  'Campos opcionais',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: adicionarCampoOpcional,
                  tooltip: 'Adicionar campo opcional',
                ),
              ],
            ),
            for (final campo in camposVisiveis)
              TextField(
                controller: camposOpcionais[campo],
                decoration: InputDecoration(labelText: campo),
              ),
            const SizedBox(height: 16),
            for (final entry in camposPersonalizados.entries)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  controller: entry.value,
                  decoration: InputDecoration(labelText: entry.key),
                ),
              ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: salvarElemento,
                icon: const Icon(Icons.save),
                label: const Text('Salvar Elemento'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
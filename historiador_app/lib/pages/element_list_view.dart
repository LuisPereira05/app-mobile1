import 'package:flutter/material.dart';
import 'package:pracashistoriador/api/elemento_pi_api.dart';
import 'package:pracashistoriador/mongo/elemento_pi.dart';
import 'element_pi_details.dart';
class ElementListViewApi extends StatefulWidget {
  final String parentId;

  const ElementListViewApi({super.key, required this.parentId});

  @override
  State<ElementListViewApi> createState() => _ElementListViewApiState();
}

class _ElementListViewApiState extends State<ElementListViewApi> {
  List<ElementoPI> elementos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchElementos();
  }

  Future<void> _fetchElementos() async {
    final data = await searchElementosByParentId(widget.parentId);
    print("---------------- ParentId: " + widget.parentId);
    // if (!mounted) return;
    setState(() {
      elementos = data;
      isLoading = false;
    });
    for (var element in elementos) {
      print("-----------Carregado: " + element.name);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (elementos.isEmpty) {
      return const Center(child: Text("Nenhum elemento encontrado."));
    }

    return ListView.builder(
      itemCount: elementos.length,
      itemBuilder: (context, index) {
        final elem = elementos[index];
        return ListTile(
          leading: (elem.photos != null && elem.photos!.isNotEmpty)
              ? Image.network(
                  elem.photos!.first,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                )
              : const Icon(Icons.image_not_supported),
          title: Text(elem.name ?? 'Sem nome'),
          subtitle: Text(elem.descripcion ?? ''),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ElementoDetailsApiPage(elemento: elem),
              ),
            );
          },
        );
      },
    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:pracashistoriador/mongo/elemento_pi.dart';



Future<List<ElementoPI>> getAllElementosPI() async {
  await dotenv.load(fileName: ".env");
  final baseUrl = dotenv.env['URL_API']!;
  final elementoUrl = Uri.parse('$baseUrl/api/elements');
  try {
    final response = await http.get(
      elementoUrl,
      headers: {
        'Content-Type': 'application/json',
        'User-Agent': 'FlutterApp/1.0'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => ElementoPI.fromJson(e)).toList();
    } else {
      throw Exception("Erro ${response.statusCode}");
    }
  } catch (e) {
    debugPrint("Erro em getAllElementosPI: $e");
    return [];
  }
}

Future<ElementoPI?> getElementoPIById(String id) async {
  await dotenv.load(fileName: ".env");
  final baseUrl = dotenv.env['URL_API']!;
  final elementoUrl = Uri.parse('$baseUrl/api/elements');
  final response = await http.get(Uri.parse('$baseUrl/api/elements/$id'));
  if (response.statusCode == 200) {
    return ElementoPI.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}

Future<List<ElementoPI>> searchElementosByParentId(String parentId) async {
  await dotenv.load(fileName: ".env");
  final baseUrl = dotenv.env['URL_API']!;
  final elementoUrl = Uri.parse('$baseUrl/api/elements');
  final response = await http.get(
    Uri.parse('$baseUrl/api/elements/search?parentId=$parentId'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((e) => ElementoPI.fromJson(e)).toList();
  } else {
    debugPrint("Erro em searchElementosByParentId: ${response.statusCode}");
    return [];
  }
}

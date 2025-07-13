import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:pracashistoriador/mongo/interest_point.dart';




Future<List<InterestPoint>> getAllInterestPoints() async {
  await dotenv.load(fileName: ".env");
  final baseUrl = dotenv.env['URL_API']!;
  final url = Uri.parse('$baseUrl/api/interest-points');

  try {
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'User-Agent': 'FlutterApp/1.0'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => InterestPoint.fromJson(e)).toList();
    } else {
      throw Exception("Error ${response.statusCode}");
    }
  } catch (e) {
    debugPrint("Error en getAllInterestPoints: $e");
    return [];
  }
}

Future<InterestPoint?> getById(String id) async {
  await dotenv.load(fileName: ".env");
  final baseUrl = dotenv.env['URL_API']!;
  final url = Uri.parse('$baseUrl/api/interest-points');
  final response = await http.get(Uri.parse('$url/$id'));
  if (response.statusCode == 200) {
    return InterestPoint.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}

Future<List<InterestPoint>> searchByName(String name) async {
  await dotenv.load(fileName: ".env");
  final baseUrl = dotenv.env['URL_API']!;
  final url = Uri.parse('$baseUrl/api/interest-points');
  final response = await http.get(Uri.parse('$url/search?name=$name'));
  if (response.statusCode == 200) {
    final List data = json.decode(response.body);
    return data.map((e) => InterestPoint.fromJson(e)).toList();
  } else {
    return [];
  }
}
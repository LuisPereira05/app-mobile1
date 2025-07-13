import 'dart:convert';
import 'package:http/http.dart' as http;
import 'interest_point_api.dart';

class InterestPointApiService {
  final String baseUrl;

  InterestPointApiService({required this.baseUrl});

  // Agora exige o token como parâmetro
  Future<List<InterestPointApi>> fetchAll({required String token}) async {
    final url = Uri.parse('$baseUrl/api/interest-points');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => InterestPointApi.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar pontos de interesse: ${response.statusCode}');
    }
  }
}

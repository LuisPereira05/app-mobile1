// lib/db/interest_point_api.dart

class InterestPointApi {
  final String? objectId;
  final String name;
  final String tipo;
  final String endereco;
  final String descripcion;
  final String bairro;
  final String? contato;
  final String? personalizados;
  final List<String> fotos;
  final String? elementos;
  final String idAuthor;
  final double lat;
  final double lon;
  final DateTime createdAt;
  final DateTime updatedAt;







  InterestPointApi({
    this.objectId,
    required this.name,
    required this.tipo,
    required this.bairro,
    required this.endereco,
    required this.descripcion,
    required this.lat,
    required this.lon,
    required this.createdAt,
    required this.updatedAt,
    this.contato,
    this.personalizados,
    required this.fotos,
    this.elementos,
    required this.idAuthor
    
  });

  factory InterestPointApi.fromJson(Map<String, dynamic> json) {
    return InterestPointApi(
      objectId: json['objectId'],
      name: json['name'],
      tipo: json['tipo'],
      endereco: json['endereco'],
      descripcion: json['descripcion'],
      bairro: json['bairro'],
      contato: json['contato'] ?? '',
      personalizados: json['personalizados'] ?? '',
      fotos: json['fotos'],
      elementos: json['elementos'],
      idAuthor: json['idAuthor'],
      lat: json['lat'],
      lon: json['lon'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'objectId' : objectId ?? null,
      'name' : name,
      'tipo' : tipo,
      'endereco' : endereco,
      'descripcion' : descripcion,
      'bairro' : bairro,
      'contato' : contato,
      'personalizados' : personalizados,
      'fotos' : fotos,
      'elementos' : elementos,
      'idAuthor' : idAuthor,
      'lat' : lat,
      'lon' : lon,
      'createdAt' : createdAt,
      'updatedAt' : updatedAt
    };
  }
}

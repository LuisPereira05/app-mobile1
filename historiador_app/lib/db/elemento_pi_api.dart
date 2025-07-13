// lib/db/interest_point_api.dart

class ElementoPIApi {
  final String? objectId;

  final String name;
  final String tipo;
  final String description;
  final String lat;
  final String lon;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String idAuthor;

  final List<String> photos;

  // Opcionais predefinidos
  final String? historico;
  final String? acessibilidade;
  final String? horarioFuncionamento;
  final String? imagensExtra;
  final String? linksUteis;

  // Campos personalizados (nome: valor)
  final String? personalizados;







  ElementoPIApi({
    this.objectId,
    required this.name,
    required this.tipo,
    required this.description,
    required this.lat,
    required this.lon,
    required this.createdAt,
    required this.updatedAt,
    required this.idAuthor,
    required this.photos,
    this.historico,
    this.acessibilidade,
    this.horarioFuncionamento,
    this.imagensExtra,
    this.linksUteis,
    this.personalizados
    
  });

  factory ElementoPIApi.fromJson(Map<String, dynamic> json) {
    return ElementoPIApi(
      objectId : json['objectId'],
      idAuthor: json['idAuthor'],
      name : json['name'],
      tipo : json['tipo'],
      description : json['description'],
      lat : json['lat'],
      lon : json['lon'],
      createdAt : json['createdAt'],
      updatedAt : json['pdatedAt'],
      photos : json['photos'],
      historico : json['historico'],
      acessibilidade : json['acessibilidade'],
      horarioFuncionamento : json['horarioFuncionamento'],
      imagensExtra : json['imagensExtra'],
      linksUteis : json['linksUteis'],
      personalizados : json['personalizados']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'objectId' : objectId ?? null,
      'idAuthor' : idAuthor,
      'name' : name,
      'tipo' : tipo,
      'description' : description,
      'lat' : lat,
      'lon' : lon,
      'createdAt' : createdAt,
      'pdatedAt' : updatedAt,
      'photos' : photos,
      'historico' : historico,
      'acessibilidade' : acessibilidade,
      'horarioFuncionamento' : horarioFuncionamento,
      'imagensExtra' : imagensExtra,
      'linksUteis' : linksUteis,
      'personalizados' : personalizados,
    };
  }
}

class InterestPoint {
  String? objectId;
  late String name;
  late String? tipo;
  late String? bairro;
  late String? endereco;
  late String? descripcion;
  late double lat;
  late double lon;
  late DateTime createdAt;
  late DateTime updatedAt;
  late String? contact;
  late String? hour;
  late String? personalizados;
  late List<String> fotos;
  late List<String> elementos;
  late String author;

  InterestPoint({
    this.objectId,
    required this.name,
    this.tipo,
    this.bairro,
    this.endereco,
    this.descripcion,
    required this.lat,
    required this.lon,
    required this.createdAt,
    required this.updatedAt,
    this.contact,
    this.hour,
    this.personalizados,
    required this.fotos,
    required this.elementos,
    required this.author,
  });

  factory InterestPoint.fromJson(Map<String, dynamic> json) {
    return InterestPoint(
      objectId: json['objectId'],
      name: json['name'] ?? '',
      tipo: json['tipo'],
      bairro: json['bairro'],
      endereco: json['endereco'],
      descripcion: json['descripcion'],
      lat: json['lat'],
      lon: json['lon'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      contact: json['contato'],
      hour: json['hour'],
      personalizados: json['personalizados'],
      fotos: (json['fotos'] as List?)?.map((e) => e.toString()).toList() ?? [],
      elementos: (json['elementos'] as List?)?.map((e) => e.toString()).toList() ?? [],
      author: json['idAuthor'] ?? '',
    );
  }
}

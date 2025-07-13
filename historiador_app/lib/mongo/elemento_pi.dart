class ElementoPI {
  String? objectId;
  late String parentId;
  late String name;
  late String? tipo;
  late String? descripcion;
  late double lat;
  late double lon;
  late DateTime createdAt;
  late DateTime updatedAt;
  late String? personalizados;
  late String idAuthor;

  late List<String> photos;
  
  late String? historico;
  late String? acessibilidade;
  late String? horarioFuncionamento;
  late String? imagensExtra;
  late String? linksUteis;


  ElementoPI({
    this.objectId,
    required this.parentId,
    required this.name,
    this.tipo,
    this.descripcion,
    required this.lat,
    required this.lon,
    required this.createdAt,
    required this.updatedAt,
    this.personalizados,
    required this.photos,
    this.historico,
    this.acessibilidade,
    this.horarioFuncionamento,
    this.imagensExtra,
    this.linksUteis,
    required this.idAuthor,
  });

  factory ElementoPI.fromJson(Map<String, dynamic> json) {
    return ElementoPI(
      objectId : json['objectId'],
      parentId: json['parentId'],
      name : json['name'],
      tipo : json['tipo'],
      descripcion : json['descripcion'],
      lat : json['lat'],
      lon : json['lon'],
      createdAt : DateTime.parse(json['createdAt']),
      updatedAt : DateTime.parse(json['updatedAt']),
      personalizados : json['personalizados'],
      idAuthor : json['idAuthor'],
      photos : List<String>.from(json['photos']),
      historico : json['historico'],
      acessibilidade : json['acessibilidade'],
      horarioFuncionamento : json['horarioFuncionamento'],
      imagensExtra : json['imagensExtra'],
      linksUteis : json['linksUteis'],
    );
  }
}

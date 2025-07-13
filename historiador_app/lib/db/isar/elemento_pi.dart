import 'package:isar/isar.dart';

part 'elemento_pi.g.dart';

@collection
class ElementoPI {

  Id id = Isar.autoIncrement;

  @Index()
  late int interestPointIsarId;

  late String interestPointOId;
  
  String? objectId;

  late String name;
  late String tipo;
  late String description;
  late double lat;
  late double lon;
  late DateTime createdAt;
  late DateTime updatedAt;
  late String idAuthor;

  List<String> photos = [];

  // Opcionais predefinidos
  String? historico;
  String? acessibilidade;
  String? horarioFuncionamento;
  String? imagensExtra;
  String? linksUteis;

  // Campos personalizados (nome: valor)
  String? personalizados;
}
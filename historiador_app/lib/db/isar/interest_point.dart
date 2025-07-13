import 'package:isar/isar.dart';
import 'elemento_pi.dart';

part 'interest_point.g.dart';

@collection
class InterestPoint {
  Id id = Isar.autoIncrement;

  String? objectId;
  late String name;
  late String tipo;
  late String endereco;
  late String descripcion;
  late String bairro;
  String? contato;
  String? personalizados;
  List<String> fotos = [];
  List<String> elementos = [];
  late String idAuthor;
  
  late double lat;
  late double lon;

  List<Id> elementosIsar = [];
  
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

}
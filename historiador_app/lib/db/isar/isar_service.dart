import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pracashistoriador/db/isar/interest_point.dart';
import 'package:pracashistoriador/db/isar/elemento_pi.dart';

class IsarService {
  // Singleton
  static final IsarService _instance = IsarService._internal();

  factory IsarService() => _instance;

  IsarService._internal();

  static Future<Isar>? _isarFuture;

  Future<Isar> _getIsarInstance() {
    _isarFuture ??= _initIsar(); // apenas inicializa uma vez
    return _isarFuture!;
  }

  Future<Isar> _initIsar() async {
    final dir = await getApplicationDocumentsDirectory();

    return await Isar.open(
      [
        InterestPointSchema,
        ElementoPISchema
      ],
      directory: dir.path,
    );
  }

  Future<void> close() async {
    final isar = await _getIsarInstance();
    await isar.close();
  }

  //--------------INTEREST POINTS

  Future<void> addInterestPoint(InterestPoint pi) async {
    final isar = await _getIsarInstance();
    await isar.writeTxn(() async {
      await isar.interestPoints.put(pi);
    });
  }

  Future<List<InterestPoint>> getAllInterestPoints() async {
    final isar = await _getIsarInstance();
    return await isar.interestPoints.where().findAll();
  }

  Future<InterestPoint?> getInterestPointById(int id) async {
    final isar = await _getIsarInstance();
    return await isar.interestPoints.get(id);
  }

  Future<InterestPoint?> getInterestPointByName(String name) async {
    final isar = await _getIsarInstance();
    return await isar.interestPoints.filter().nameEqualTo(name).findFirst();
  }

  Future<void> updateInterestPoint(InterestPoint pi) async {
    final isar = await _getIsarInstance();
    await isar.writeTxn(() async {
      pi.updatedAt = DateTime.now();
      await isar.interestPoints.put(pi);
    });
  }

  Future<void> deleteInterestPoint(int id) async {
    final isar = await _getIsarInstance();
    await isar.writeTxn(() async {
      await isar.interestPoints.delete(id);
    });
  }

  Future<void> clearAllInterestPoints() async {
    final isar = await _getIsarInstance();
    await isar.writeTxn(() async {
      await isar.interestPoints.clear();
    });
  }


  //------------------ELEMENTOPI



  Future<int> addElementoPI(ElementoPI elemento) async {
    final isar = await _getIsarInstance();
    return await isar.writeTxn(() async {
      return await isar.elementoPIs.put(elemento);
    });
  }

  Future<List<ElementoPI>> getAllElementoPIs() async {
    final isar = await _getIsarInstance();
    return await isar.elementoPIs.where().findAll();
  }

  Future<ElementoPI?> getElementoPIById(int id) async {
    final isar = await _getIsarInstance();
    return await isar.elementoPIs.get(id);
  }

  Future<ElementoPI?> getElementoPIByName(String name) async {
    final isar = await _getIsarInstance();
    return await isar.elementoPIs.filter().nameEqualTo(name).findFirst();
  }

  Future<void> updateElementoPI(ElementoPI elemento) async {
    final isar = await _getIsarInstance();
    await isar.writeTxn(() async {
      elemento.updatedAt = DateTime.now();
      await isar.elementoPIs.put(elemento);
    });
  }

  Future<void> deleteElementoPI(int id) async {
    final isar = await _getIsarInstance();
    await isar.writeTxn(() async {
      await isar.elementoPIs.delete(id);
    });
  }

  Future<void> clearAllElementoPIs() async {
    final isar = await _getIsarInstance();
    await isar.writeTxn(() async {
      await isar.elementoPIs.clear();
    });
  }

  Future<List<ElementoPI>> getElementosByInterestPoint(InterestPoint ip) async {
    final isar = await _getIsarInstance();

    if (ip.elementosIsar.isEmpty) return [];

    // Buscar todos os elementos um por um
    final elementos = <ElementoPI>[];

    for (final id in ip.elementosIsar) {
      final elemento = await isar.elementoPIs.get(id);
      if (elemento != null) {
        elementos.add(elemento);
      }
    }

    return elementos;
  }

  Future<List<ElementoPI>> getElementosByInterestPointId(int interestPointIsarId) async {
    final isar = await _getIsarInstance();

    final query = isar.elementoPIs.filter()
      .interestPointIsarIdEqualTo(interestPointIsarId)
      .build();

    final elementos = await query.findAll();

    return elementos;
  }
}
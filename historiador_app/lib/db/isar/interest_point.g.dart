// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_point.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInterestPointCollection on Isar {
  IsarCollection<InterestPoint> get interestPoints => this.collection();
}

const InterestPointSchema = CollectionSchema(
  name: r'InterestPoint',
  id: -7580602362171825062,
  properties: {
    r'bairro': PropertySchema(
      id: 0,
      name: r'bairro',
      type: IsarType.string,
    ),
    r'contato': PropertySchema(
      id: 1,
      name: r'contato',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'descripcion': PropertySchema(
      id: 3,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'elementos': PropertySchema(
      id: 4,
      name: r'elementos',
      type: IsarType.stringList,
    ),
    r'elementosIsar': PropertySchema(
      id: 5,
      name: r'elementosIsar',
      type: IsarType.longList,
    ),
    r'endereco': PropertySchema(
      id: 6,
      name: r'endereco',
      type: IsarType.string,
    ),
    r'fotos': PropertySchema(
      id: 7,
      name: r'fotos',
      type: IsarType.stringList,
    ),
    r'idAuthor': PropertySchema(
      id: 8,
      name: r'idAuthor',
      type: IsarType.string,
    ),
    r'lat': PropertySchema(
      id: 9,
      name: r'lat',
      type: IsarType.double,
    ),
    r'lon': PropertySchema(
      id: 10,
      name: r'lon',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 11,
      name: r'name',
      type: IsarType.string,
    ),
    r'objectId': PropertySchema(
      id: 12,
      name: r'objectId',
      type: IsarType.string,
    ),
    r'personalizados': PropertySchema(
      id: 13,
      name: r'personalizados',
      type: IsarType.string,
    ),
    r'tipo': PropertySchema(
      id: 14,
      name: r'tipo',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 15,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _interestPointEstimateSize,
  serialize: _interestPointSerialize,
  deserialize: _interestPointDeserialize,
  deserializeProp: _interestPointDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _interestPointGetId,
  getLinks: _interestPointGetLinks,
  attach: _interestPointAttach,
  version: '3.1.0+1',
);

int _interestPointEstimateSize(
  InterestPoint object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bairro.length * 3;
  {
    final value = object.contato;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.descripcion.length * 3;
  bytesCount += 3 + object.elementos.length * 3;
  {
    for (var i = 0; i < object.elementos.length; i++) {
      final value = object.elementos[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.elementosIsar.length * 8;
  bytesCount += 3 + object.endereco.length * 3;
  bytesCount += 3 + object.fotos.length * 3;
  {
    for (var i = 0; i < object.fotos.length; i++) {
      final value = object.fotos[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.idAuthor.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.objectId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.personalizados;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tipo.length * 3;
  return bytesCount;
}

void _interestPointSerialize(
  InterestPoint object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bairro);
  writer.writeString(offsets[1], object.contato);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.descripcion);
  writer.writeStringList(offsets[4], object.elementos);
  writer.writeLongList(offsets[5], object.elementosIsar);
  writer.writeString(offsets[6], object.endereco);
  writer.writeStringList(offsets[7], object.fotos);
  writer.writeString(offsets[8], object.idAuthor);
  writer.writeDouble(offsets[9], object.lat);
  writer.writeDouble(offsets[10], object.lon);
  writer.writeString(offsets[11], object.name);
  writer.writeString(offsets[12], object.objectId);
  writer.writeString(offsets[13], object.personalizados);
  writer.writeString(offsets[14], object.tipo);
  writer.writeDateTime(offsets[15], object.updatedAt);
}

InterestPoint _interestPointDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InterestPoint();
  object.bairro = reader.readString(offsets[0]);
  object.contato = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.descripcion = reader.readString(offsets[3]);
  object.elementos = reader.readStringList(offsets[4]) ?? [];
  object.elementosIsar = reader.readLongList(offsets[5]) ?? [];
  object.endereco = reader.readString(offsets[6]);
  object.fotos = reader.readStringList(offsets[7]) ?? [];
  object.id = id;
  object.idAuthor = reader.readString(offsets[8]);
  object.lat = reader.readDouble(offsets[9]);
  object.lon = reader.readDouble(offsets[10]);
  object.name = reader.readString(offsets[11]);
  object.objectId = reader.readStringOrNull(offsets[12]);
  object.personalizados = reader.readStringOrNull(offsets[13]);
  object.tipo = reader.readString(offsets[14]);
  object.updatedAt = reader.readDateTime(offsets[15]);
  return object;
}

P _interestPointDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readLongList(offset) ?? []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _interestPointGetId(InterestPoint object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _interestPointGetLinks(InterestPoint object) {
  return [];
}

void _interestPointAttach(
    IsarCollection<dynamic> col, Id id, InterestPoint object) {
  object.id = id;
}

extension InterestPointQueryWhereSort
    on QueryBuilder<InterestPoint, InterestPoint, QWhere> {
  QueryBuilder<InterestPoint, InterestPoint, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InterestPointQueryWhere
    on QueryBuilder<InterestPoint, InterestPoint, QWhereClause> {
  QueryBuilder<InterestPoint, InterestPoint, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InterestPointQueryFilter
    on QueryBuilder<InterestPoint, InterestPoint, QFilterCondition> {
  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      bairroEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      bairroGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      bairroLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      bairroBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bairro',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      bairroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      bairroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      bairroContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      bairroMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bairro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      bairroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      bairroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contato',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contato',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contato',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contato',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contato',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contato',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      contatoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contato',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      descripcionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      descripcionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      descripcionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      descripcionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elementos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'elementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'elementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'elementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'elementos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elementos',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'elementos',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsarElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elementosIsar',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsarElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elementosIsar',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsarElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elementosIsar',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsarElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elementosIsar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsarLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementosIsar',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementosIsar',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementosIsar',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsarLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementosIsar',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsarLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementosIsar',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      elementosIsarLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'elementosIsar',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      enderecoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      enderecoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      enderecoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      enderecoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endereco',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      enderecoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      enderecoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      enderecoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      enderecoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endereco',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      enderecoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endereco',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      enderecoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endereco',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fotos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fotos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fotos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fotos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fotos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fotos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fotos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fotos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fotos',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fotos',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      fotosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      idAuthorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      idAuthorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      idAuthorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      idAuthorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idAuthor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      idAuthorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      idAuthorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      idAuthorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      idAuthorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idAuthor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      idAuthorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAuthor',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      idAuthorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idAuthor',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> latEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      latGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> latLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> latBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> lonEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      lonGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> lonLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> lonBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'objectId',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'objectId',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'objectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'objectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'objectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'objectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'objectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'objectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'objectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'objectId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'objectId',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      objectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'objectId',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'personalizados',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'personalizados',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personalizados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'personalizados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'personalizados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'personalizados',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'personalizados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'personalizados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'personalizados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'personalizados',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personalizados',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      personalizadosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'personalizados',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> tipoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      tipoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      tipoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> tipoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      tipoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      tipoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      tipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition> tipoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InterestPointQueryObject
    on QueryBuilder<InterestPoint, InterestPoint, QFilterCondition> {}

extension InterestPointQueryLinks
    on QueryBuilder<InterestPoint, InterestPoint, QFilterCondition> {}

extension InterestPointQuerySortBy
    on QueryBuilder<InterestPoint, InterestPoint, QSortBy> {
  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByContato() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contato', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByContatoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contato', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByEndereco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endereco', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      sortByEnderecoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endereco', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByIdAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAuthor', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      sortByIdAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAuthor', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByObjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      sortByObjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      sortByPersonalizados() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizados', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      sortByPersonalizadosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizados', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension InterestPointQuerySortThenBy
    on QueryBuilder<InterestPoint, InterestPoint, QSortThenBy> {
  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByContato() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contato', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByContatoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contato', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByEndereco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endereco', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      thenByEnderecoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endereco', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByIdAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAuthor', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      thenByIdAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAuthor', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByObjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      thenByObjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      thenByPersonalizados() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizados', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      thenByPersonalizadosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizados', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension InterestPointQueryWhereDistinct
    on QueryBuilder<InterestPoint, InterestPoint, QDistinct> {
  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByBairro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bairro', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByContato(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contato', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByElementos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'elementos');
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct>
      distinctByElementosIsar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'elementosIsar');
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByEndereco(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endereco', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByFotos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fotos');
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByIdAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idAuthor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat');
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lon');
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByObjectId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'objectId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct>
      distinctByPersonalizados({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'personalizados',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InterestPoint, InterestPoint, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension InterestPointQueryProperty
    on QueryBuilder<InterestPoint, InterestPoint, QQueryProperty> {
  QueryBuilder<InterestPoint, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InterestPoint, String, QQueryOperations> bairroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bairro');
    });
  }

  QueryBuilder<InterestPoint, String?, QQueryOperations> contatoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contato');
    });
  }

  QueryBuilder<InterestPoint, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<InterestPoint, String, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<InterestPoint, List<String>, QQueryOperations>
      elementosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'elementos');
    });
  }

  QueryBuilder<InterestPoint, List<int>, QQueryOperations>
      elementosIsarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'elementosIsar');
    });
  }

  QueryBuilder<InterestPoint, String, QQueryOperations> enderecoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endereco');
    });
  }

  QueryBuilder<InterestPoint, List<String>, QQueryOperations> fotosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fotos');
    });
  }

  QueryBuilder<InterestPoint, String, QQueryOperations> idAuthorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAuthor');
    });
  }

  QueryBuilder<InterestPoint, double, QQueryOperations> latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<InterestPoint, double, QQueryOperations> lonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lon');
    });
  }

  QueryBuilder<InterestPoint, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<InterestPoint, String?, QQueryOperations> objectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'objectId');
    });
  }

  QueryBuilder<InterestPoint, String?, QQueryOperations>
      personalizadosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'personalizados');
    });
  }

  QueryBuilder<InterestPoint, String, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }

  QueryBuilder<InterestPoint, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elemento_pi.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetElementoPICollection on Isar {
  IsarCollection<ElementoPI> get elementoPIs => this.collection();
}

const ElementoPISchema = CollectionSchema(
  name: r'ElementoPI',
  id: 7424263557734458926,
  properties: {
    r'acessibilidade': PropertySchema(
      id: 0,
      name: r'acessibilidade',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'historico': PropertySchema(
      id: 3,
      name: r'historico',
      type: IsarType.string,
    ),
    r'horarioFuncionamento': PropertySchema(
      id: 4,
      name: r'horarioFuncionamento',
      type: IsarType.string,
    ),
    r'idAuthor': PropertySchema(
      id: 5,
      name: r'idAuthor',
      type: IsarType.string,
    ),
    r'imagensExtra': PropertySchema(
      id: 6,
      name: r'imagensExtra',
      type: IsarType.string,
    ),
    r'interestPointIsarId': PropertySchema(
      id: 7,
      name: r'interestPointIsarId',
      type: IsarType.long,
    ),
    r'interestPointOId': PropertySchema(
      id: 8,
      name: r'interestPointOId',
      type: IsarType.string,
    ),
    r'lat': PropertySchema(
      id: 9,
      name: r'lat',
      type: IsarType.double,
    ),
    r'linksUteis': PropertySchema(
      id: 10,
      name: r'linksUteis',
      type: IsarType.string,
    ),
    r'lon': PropertySchema(
      id: 11,
      name: r'lon',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 12,
      name: r'name',
      type: IsarType.string,
    ),
    r'objectId': PropertySchema(
      id: 13,
      name: r'objectId',
      type: IsarType.string,
    ),
    r'personalizados': PropertySchema(
      id: 14,
      name: r'personalizados',
      type: IsarType.string,
    ),
    r'photos': PropertySchema(
      id: 15,
      name: r'photos',
      type: IsarType.stringList,
    ),
    r'tipo': PropertySchema(
      id: 16,
      name: r'tipo',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 17,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _elementoPIEstimateSize,
  serialize: _elementoPISerialize,
  deserialize: _elementoPIDeserialize,
  deserializeProp: _elementoPIDeserializeProp,
  idName: r'id',
  indexes: {
    r'interestPointIsarId': IndexSchema(
      id: -5043070076045269218,
      name: r'interestPointIsarId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'interestPointIsarId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _elementoPIGetId,
  getLinks: _elementoPIGetLinks,
  attach: _elementoPIAttach,
  version: '3.1.0+1',
);

int _elementoPIEstimateSize(
  ElementoPI object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.acessibilidade;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.description.length * 3;
  {
    final value = object.historico;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.horarioFuncionamento;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.idAuthor.length * 3;
  {
    final value = object.imagensExtra;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.interestPointOId.length * 3;
  {
    final value = object.linksUteis;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
  bytesCount += 3 + object.photos.length * 3;
  {
    for (var i = 0; i < object.photos.length; i++) {
      final value = object.photos[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.tipo.length * 3;
  return bytesCount;
}

void _elementoPISerialize(
  ElementoPI object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.acessibilidade);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.historico);
  writer.writeString(offsets[4], object.horarioFuncionamento);
  writer.writeString(offsets[5], object.idAuthor);
  writer.writeString(offsets[6], object.imagensExtra);
  writer.writeLong(offsets[7], object.interestPointIsarId);
  writer.writeString(offsets[8], object.interestPointOId);
  writer.writeDouble(offsets[9], object.lat);
  writer.writeString(offsets[10], object.linksUteis);
  writer.writeDouble(offsets[11], object.lon);
  writer.writeString(offsets[12], object.name);
  writer.writeString(offsets[13], object.objectId);
  writer.writeString(offsets[14], object.personalizados);
  writer.writeStringList(offsets[15], object.photos);
  writer.writeString(offsets[16], object.tipo);
  writer.writeDateTime(offsets[17], object.updatedAt);
}

ElementoPI _elementoPIDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ElementoPI();
  object.acessibilidade = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.description = reader.readString(offsets[2]);
  object.historico = reader.readStringOrNull(offsets[3]);
  object.horarioFuncionamento = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.idAuthor = reader.readString(offsets[5]);
  object.imagensExtra = reader.readStringOrNull(offsets[6]);
  object.interestPointIsarId = reader.readLong(offsets[7]);
  object.interestPointOId = reader.readString(offsets[8]);
  object.lat = reader.readDouble(offsets[9]);
  object.linksUteis = reader.readStringOrNull(offsets[10]);
  object.lon = reader.readDouble(offsets[11]);
  object.name = reader.readString(offsets[12]);
  object.objectId = reader.readStringOrNull(offsets[13]);
  object.personalizados = reader.readStringOrNull(offsets[14]);
  object.photos = reader.readStringList(offsets[15]) ?? [];
  object.tipo = reader.readString(offsets[16]);
  object.updatedAt = reader.readDateTime(offsets[17]);
  return object;
}

P _elementoPIDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringList(offset) ?? []) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _elementoPIGetId(ElementoPI object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _elementoPIGetLinks(ElementoPI object) {
  return [];
}

void _elementoPIAttach(IsarCollection<dynamic> col, Id id, ElementoPI object) {
  object.id = id;
}

extension ElementoPIQueryWhereSort
    on QueryBuilder<ElementoPI, ElementoPI, QWhere> {
  QueryBuilder<ElementoPI, ElementoPI, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterWhere> anyInterestPointIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'interestPointIsarId'),
      );
    });
  }
}

extension ElementoPIQueryWhere
    on QueryBuilder<ElementoPI, ElementoPI, QWhereClause> {
  QueryBuilder<ElementoPI, ElementoPI, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterWhereClause> idBetween(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterWhereClause>
      interestPointIsarIdEqualTo(int interestPointIsarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'interestPointIsarId',
        value: [interestPointIsarId],
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterWhereClause>
      interestPointIsarIdNotEqualTo(int interestPointIsarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'interestPointIsarId',
              lower: [],
              upper: [interestPointIsarId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'interestPointIsarId',
              lower: [interestPointIsarId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'interestPointIsarId',
              lower: [interestPointIsarId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'interestPointIsarId',
              lower: [],
              upper: [interestPointIsarId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterWhereClause>
      interestPointIsarIdGreaterThan(
    int interestPointIsarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'interestPointIsarId',
        lower: [interestPointIsarId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterWhereClause>
      interestPointIsarIdLessThan(
    int interestPointIsarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'interestPointIsarId',
        lower: [],
        upper: [interestPointIsarId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterWhereClause>
      interestPointIsarIdBetween(
    int lowerInterestPointIsarId,
    int upperInterestPointIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'interestPointIsarId',
        lower: [lowerInterestPointIsarId],
        includeLower: includeLower,
        upper: [upperInterestPointIsarId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ElementoPIQueryFilter
    on QueryBuilder<ElementoPI, ElementoPI, QFilterCondition> {
  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'acessibilidade',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'acessibilidade',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'acessibilidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'acessibilidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'acessibilidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'acessibilidade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'acessibilidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'acessibilidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'acessibilidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'acessibilidade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'acessibilidade',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      acessibilidadeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'acessibilidade',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      historicoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'historico',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      historicoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'historico',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> historicoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      historicoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> historicoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> historicoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historico',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      historicoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'historico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> historicoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'historico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> historicoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'historico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> historicoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'historico',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      historicoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historico',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      historicoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'historico',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'horarioFuncionamento',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'horarioFuncionamento',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horarioFuncionamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horarioFuncionamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horarioFuncionamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horarioFuncionamento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'horarioFuncionamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'horarioFuncionamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'horarioFuncionamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'horarioFuncionamento',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horarioFuncionamento',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      horarioFuncionamentoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'horarioFuncionamento',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> idAuthorEqualTo(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> idAuthorLessThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> idAuthorBetween(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> idAuthorEndsWith(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> idAuthorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> idAuthorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idAuthor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      idAuthorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAuthor',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      idAuthorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idAuthor',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagensExtra',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagensExtra',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagensExtra',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagensExtra',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagensExtra',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagensExtra',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagensExtra',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagensExtra',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagensExtra',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagensExtra',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagensExtra',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      imagensExtraIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagensExtra',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointIsarIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interestPointIsarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointIsarIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interestPointIsarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointIsarIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interestPointIsarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointIsarIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interestPointIsarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointOIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interestPointOId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointOIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interestPointOId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointOIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interestPointOId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointOIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interestPointOId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointOIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'interestPointOId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointOIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'interestPointOId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointOIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'interestPointOId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointOIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'interestPointOId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointOIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interestPointOId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      interestPointOIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'interestPointOId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> latEqualTo(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> latGreaterThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> latLessThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> latBetween(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      linksUteisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linksUteis',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      linksUteisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linksUteis',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> linksUteisEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linksUteis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      linksUteisGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linksUteis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      linksUteisLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linksUteis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> linksUteisBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linksUteis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      linksUteisStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linksUteis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      linksUteisEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linksUteis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      linksUteisContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linksUteis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> linksUteisMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linksUteis',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      linksUteisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linksUteis',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      linksUteisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linksUteis',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> lonEqualTo(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> lonGreaterThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> lonLessThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> lonBetween(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> objectIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'objectId',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      objectIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'objectId',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> objectIdEqualTo(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> objectIdLessThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> objectIdBetween(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> objectIdEndsWith(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> objectIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'objectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> objectIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'objectId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      objectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'objectId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      objectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'objectId',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      personalizadosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'personalizados',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      personalizadosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'personalizados',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      personalizadosContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'personalizados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      personalizadosMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'personalizados',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      personalizadosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personalizados',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      personalizadosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'personalizados',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photos',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photos',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> photosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
      photosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> tipoEqualTo(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> tipoGreaterThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> tipoLessThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> tipoBetween(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> tipoStartsWith(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> tipoEndsWith(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> tipoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> tipoMatches(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition>
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<ElementoPI, ElementoPI, QAfterFilterCondition> updatedAtBetween(
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

extension ElementoPIQueryObject
    on QueryBuilder<ElementoPI, ElementoPI, QFilterCondition> {}

extension ElementoPIQueryLinks
    on QueryBuilder<ElementoPI, ElementoPI, QFilterCondition> {}

extension ElementoPIQuerySortBy
    on QueryBuilder<ElementoPI, ElementoPI, QSortBy> {
  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByAcessibilidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acessibilidade', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      sortByAcessibilidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acessibilidade', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByHistorico() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historico', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByHistoricoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historico', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      sortByHorarioFuncionamento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horarioFuncionamento', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      sortByHorarioFuncionamentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horarioFuncionamento', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByIdAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAuthor', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByIdAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAuthor', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByImagensExtra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagensExtra', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByImagensExtraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagensExtra', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      sortByInterestPointIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestPointIsarId', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      sortByInterestPointIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestPointIsarId', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByInterestPointOId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestPointOId', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      sortByInterestPointOIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestPointOId', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByLinksUteis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linksUteis', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByLinksUteisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linksUteis', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByObjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByObjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByPersonalizados() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizados', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      sortByPersonalizadosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizados', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ElementoPIQuerySortThenBy
    on QueryBuilder<ElementoPI, ElementoPI, QSortThenBy> {
  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByAcessibilidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acessibilidade', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      thenByAcessibilidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acessibilidade', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByHistorico() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historico', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByHistoricoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'historico', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      thenByHorarioFuncionamento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horarioFuncionamento', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      thenByHorarioFuncionamentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horarioFuncionamento', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByIdAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAuthor', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByIdAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAuthor', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByImagensExtra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagensExtra', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByImagensExtraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagensExtra', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      thenByInterestPointIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestPointIsarId', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      thenByInterestPointIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestPointIsarId', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByInterestPointOId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestPointOId', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      thenByInterestPointOIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestPointOId', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByLinksUteis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linksUteis', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByLinksUteisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linksUteis', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByObjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByObjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByPersonalizados() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizados', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy>
      thenByPersonalizadosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizados', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ElementoPIQueryWhereDistinct
    on QueryBuilder<ElementoPI, ElementoPI, QDistinct> {
  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByAcessibilidade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'acessibilidade',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByHistorico(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'historico', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct>
      distinctByHorarioFuncionamento({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horarioFuncionamento',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByIdAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idAuthor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByImagensExtra(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagensExtra', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct>
      distinctByInterestPointIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interestPointIsarId');
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByInterestPointOId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interestPointOId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat');
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByLinksUteis(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linksUteis', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lon');
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByObjectId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'objectId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByPersonalizados(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'personalizados',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByPhotos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photos');
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ElementoPI, ElementoPI, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ElementoPIQueryProperty
    on QueryBuilder<ElementoPI, ElementoPI, QQueryProperty> {
  QueryBuilder<ElementoPI, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ElementoPI, String?, QQueryOperations> acessibilidadeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'acessibilidade');
    });
  }

  QueryBuilder<ElementoPI, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ElementoPI, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ElementoPI, String?, QQueryOperations> historicoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'historico');
    });
  }

  QueryBuilder<ElementoPI, String?, QQueryOperations>
      horarioFuncionamentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horarioFuncionamento');
    });
  }

  QueryBuilder<ElementoPI, String, QQueryOperations> idAuthorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAuthor');
    });
  }

  QueryBuilder<ElementoPI, String?, QQueryOperations> imagensExtraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagensExtra');
    });
  }

  QueryBuilder<ElementoPI, int, QQueryOperations>
      interestPointIsarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interestPointIsarId');
    });
  }

  QueryBuilder<ElementoPI, String, QQueryOperations>
      interestPointOIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interestPointOId');
    });
  }

  QueryBuilder<ElementoPI, double, QQueryOperations> latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<ElementoPI, String?, QQueryOperations> linksUteisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linksUteis');
    });
  }

  QueryBuilder<ElementoPI, double, QQueryOperations> lonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lon');
    });
  }

  QueryBuilder<ElementoPI, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ElementoPI, String?, QQueryOperations> objectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'objectId');
    });
  }

  QueryBuilder<ElementoPI, String?, QQueryOperations> personalizadosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'personalizados');
    });
  }

  QueryBuilder<ElementoPI, List<String>, QQueryOperations> photosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photos');
    });
  }

  QueryBuilder<ElementoPI, String, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }

  QueryBuilder<ElementoPI, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

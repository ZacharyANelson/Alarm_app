// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class AlarmsTableData extends DataClass
    implements Insertable<AlarmsTableData> {
  final int id;
  final String name;
  final String image;
  final String discription;
  AlarmsTableData(
      {this.id,
      @required this.name,
      @required this.image,
      @required this.discription});
  factory AlarmsTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return AlarmsTableData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      discription: stringType.mapFromDatabaseResponse(data['${effectivePrefix}dose']),
    );
  }
  factory AlarmsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return AlarmsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      discription: serializer.fromJson<String>(json['dose']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'dose': serializer.toJson<String>(discription),
    };
  }

  @override
  AlarmTableCompanion createCompanion(bool nullToAbsent) {
    return AlarmTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      discc: discription == null && nullToAbsent ? const Value.absent() : Value(discription),
    );
  }

  AlarmsTableData copyWith(
          {int id, String name, String image, String disc}) =>
      AlarmsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        discription: disc ?? this.discription,
      );
  @override
  String toString() {
    return (StringBuffer('AlarmTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('disc: $discription')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(name.hashCode, $mrjc(image.hashCode, discription.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is AlarmsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.discription == this.discription);
}

class AlarmTableCompanion extends UpdateCompanion<AlarmsTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<String> discc;
  const AlarmTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.discc = const Value.absent(),
  });
  AlarmTableCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String image,
    @required String disc,
  })  : name = Value(name),
        image = Value(image),
        discc = Value(disc);
  AlarmTableCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> image,
      Value<String> disc}) {
    return AlarmTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      discc: disc ?? this.discc,
    );
  }
}

class $AlarmTableTable extends AlarmsTable
    with TableInfo<$AlarmTableTable, AlarmsTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $AlarmTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 5, maxTextLength: 50);
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }



  final VerificationMeta _discMeta = const VerificationMeta('disc');
  GeneratedTextColumn _disc;
  @override
  GeneratedTextColumn get disc => _disc ??= _constructDisc();
  GeneratedTextColumn _constructDisc() {
    return GeneratedTextColumn(
      'dose',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, image, disc];
  @override
  $AlarmTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'medicines_table';
  @override
  final String actualTableName = 'medicines_table';
  @override
  VerificationContext validateIntegrity(AlarmTableCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.image.present) {
      context.handle(
          _imageMeta, image.isAcceptableValue(d.image.value, _imageMeta));
    } else if (image.isRequired && isInserting) {
      context.missing(_imageMeta);
    }
    if (d.discc.present) {
      context.handle(
          _discMeta, disc.isAcceptableValue(d.discc.value, _discMeta));
    } else if (disc.isRequired && isInserting) {
      context.missing(_discMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AlarmsTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AlarmsTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(AlarmTableCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.image.present) {
      map['image'] = Variable<String, StringType>(d.image.value);
    }
    if (d.discc.present) {
      map['dose'] = Variable<String, StringType>(d.discc.value);
    }
    return map;
  }
//musabagab showed how to to do alot
  @override
  $AlarmTableTable createAlias(String alias) {
    return $AlarmTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $AlarmTableTable _alarmsTable;
  $AlarmTableTable get AlarmTable =>
      _alarmsTable ??= $AlarmTableTable(this);
  @override
  List<TableInfo> get allTables => [AlarmTable];
}
// **************************************************************************
// MoorGenerator
// **************************************************************************
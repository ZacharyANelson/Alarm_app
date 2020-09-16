import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

class AlarmsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 5, max: 50)();
  TextColumn get image => text()();
  TextColumn get disc => text()();
}

@UseMoor(tables: [AlarmsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<AlarmsTableData>> getAllAlarms() =>
      select(AlarmTable).get();
  Future insertAlarm(AlarmsTableData alarm) =>
      into(AlarmTable).insert(alarm);
  Future updateMedicine(AlarmsTableData alarm) =>
      update(AlarmTable).replace(alarm);
  Future deleteAlarm(AlarmsTableData alarm) =>
      delete(AlarmTable).delete(alarm);
}

import 'package:AlarmApp/notifications/NotificationManager.dart';


import '../database/moor_database.dart';
import 'icon_enum.dart';
import 'package:scoped_model/scoped_model.dart';

class AlarmsModel extends Model with DayMixin {
  final AppDatabase _database = AppDatabase();
  final NotificationManager notificationManager = NotificationManager();
  AlarmsModel();

  Future<List<AlarmsTableData>> getAlarmsList() async {
    return await _database.getAllAlarms();
  }

  AppDatabase getDatabase() {
    return _database;
  }

  void toggleIconState() {
    toggleState();
    notifyListeners();
  }

  DeleteDayState getIconState() {
    return getDayState();
  }

  void refreshList() {
    notifyListeners();
  }
}

mixin DayMixin {
  var dayState = DeleteDayState.hide; // default

  void toggleState() {
    if (dayState == DeleteDayState.hide) {
      dayState = DeleteDayState.show;
    } else {
      dayState = DeleteDayState.hide;
    }
  }

  DeleteDayState getDayState() {
    return dayState;
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/icon_enum.dart';
import 'models/Alarm.dart';
import 'AppBar.dart';
import 'Deletion.dart';
import 'AlarmGrid.dart';
import 'AddAlarms.dart';
import 'AlarmEmptyState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Alarms',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff064bba),
          accentColor: Color(0xffba0606),
        ),
        home: MyAlarms(),
      ),
    );
  }
}

class MyAlarms extends StatefulWidget {
  MyAlarms();

  @override
  _MyalarmsApp createState() => _MyalarmsApp();
}

class _MyalarmsApp extends State<MyAlarms> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;//https://stackoverflow.com/questions/43122113/sizing-elements-to-percentage-of-screen-width-height
    AlarmsModel model;
    return ScopedModel<AlarmsModel>(
      model: model = AlarmsModel(),
      child: Scaffold(
        //https://medium.com/flutter-community/flutter-beginners-guide-to-using-the-bottom-sheet-b8025573c433
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              buildBottomSheet(deviceHeight, model);
              color: Colors.white;
            },
            child: Icon(
              Icons.add_alarm,
              size: 40,
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).accentColor,
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                MyAppBar(blueColor: Theme.of(context).primaryColor),
                Expanded(
                  child: ScopedModelDescendant<AlarmsModel>(
                    builder: (context, child, model) {
                      return Stack(children: <Widget>[
                        buildAlarmsView(model),
                        (model.getDayState() == DeleteDayState.hide)
                            ? Container()
                            : DeleteIcon()
                      ]);
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }

  FutureBuilder buildAlarmsView(model) {
    return FutureBuilder(
      future: model.getAlarmsList(),
      builder: (content, screen) {
        if (screen.hasData) {
          print(screen.data);
          if (screen.data.length == 0) {
            // If nothign entered yet go to "no Alarms Set screen"
            return Center(child: AlarmEmptyState());
          }
          return AlarmsGridView(screen.data);
        }
        return (Container());
      },
    );
  }

  void buildBottomSheet(double height, AlarmsModel model) async {
    var AlarmId = await showModalBottomSheet(
      //https://api.flutter.dev/flutter/painting/BeveledRectangleBorder-class.html
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return (
            AddAlarms(height, model.getDatabase(), model.notificationManager));
        });

    if (AlarmId != null) {
      //https://pub.dev/packages/fluttertoast
      FlutterToast.showToast(
          msg: "Alarm added!",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.indigo,
          textColor: Colors.white,
          fontSize: 30.0);

      setState(() {});
    }
  }
}

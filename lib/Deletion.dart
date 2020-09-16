import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'database/moor_database.dart';
import 'models/Alarm.dart';
//https://www.youtube.com/watch?v=zpO6n_oZWw0
class DeleteIcon extends StatefulWidget {
  Color color = Colors.grey;
  @override
  _DeleteAlarmState createState() => _DeleteAlarmState();
}

class _DeleteAlarmState extends State<DeleteIcon> {
  @override
  Widget build(BuildContext context) {
    return Positioned(top:10 ,bottom:10,left: 100,right: 100,
        child: ScopedModelDescendant<AlarmsModel>(
            builder: (context, child, model) {
          return DragTarget<AlarmsTableData>(
            builder: (context, badInfo, candidtateData) {
              return(
                Container(
                  width: 250,
                  height: 220,

                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      Icons.delete_forever,
                      color: widget.color,
                      size: 60,
                    ),
                  ),
                )
              );
            },
            onWillAccept: (alarm) {
              setState(() {
                widget.color = Colors.red;
              });
              return true;
            },
            onLeave: (v) {
              setState(() {
                widget.color = Colors.grey;
              });
            },
            onAccept: (alarm) {
              model.getDatabase().deleteAlarm(alarm);
              model.notificationManager.removeAlarm(alarm.id);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    'Alarm Removed!',
                    style: TextStyle(fontSize: 20),
                  ),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          );
        }));
  }
}

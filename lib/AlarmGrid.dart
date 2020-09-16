import 'database/moor_database.dart';
import 'models/Alarm.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
//Resources:
//https://api.flutter.dev/flutter/widgets/GridView-class.html
//https://www.youtube.com/watch?v=-zJ6CnOVndE
//https://medium.com/@soonsantos/how-to-use-scopedmodel-in-flutter-f4178a728f99
class AlarmsGridView extends StatelessWidget {
  final List<AlarmsTableData> list;
  AlarmsGridView(this.list);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AlarmsModel>(
        builder: (context, child, model) {
      return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        children: list.map((alarms) {
          return InkWell(
            onTap: () {
            },
            child: buildLongPressDraggable(alarms, model),
          );
        }).toList(),
      );
    });
  }

  LongPressDraggable<AlarmsTableData> buildLongPressDraggable(
      alarms, AlarmsModel model) {
    return LongPressDraggable<AlarmsTableData>(
      data: alarms,
      onDragStarted: () {
        model.toggleIconState();
      },
      onDragEnd: (hide) {
        model.toggleIconState();
      },
      child: Card(
          margin: EdgeInsets.all(10),
          child: AlarmCard(alarms, Colors.white),
        ),
      childWhenDragging: Container(
        color: Color(0xff696969),
      ),
      feedback: Card(
        child: AlarmCard(alarms, Colors.transparent),
      ),
    );
  }
}
//https://api.flutter.dev/flutter/widgets/Image/Image.asset.html
class AlarmCard extends StatelessWidget {
  final AlarmsTableData alarm;
  final Color color;

  AlarmCard(this.alarm, this.color);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: 150,
      height: 150,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(100),
            width: 80,
            height: 80,
            child: Hero(
              tag: alarm.name,
              child: Image.asset(
                alarm.image,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 2, right: 2),
                child: Text(
                  alarm.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: width * .06),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                alarm.discription,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: width * .034,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

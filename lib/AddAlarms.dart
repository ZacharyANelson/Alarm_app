import 'package:flutter/material.dart';
import 'package:AlarmApp/database/moor_database.dart';
import 'package:AlarmApp/notifications/NotificationManager.dart';
//https://pub.dev/packages/flutter_local_notifications
class AddAlarms extends StatefulWidget {
  final double height;
  final AppDatabase _database;
  final NotificationManager manager;
  AddAlarms(this.height, this._database, this.manager);

  @override
  _AddAlarmsState createState() => _AddAlarmsState();
}

class _AddAlarmsState extends State<AddAlarms> {
  static final _createKey = new GlobalKey<FormState>();
  String _name;
  String _disc;

  int _selectIndex = 0;
  List<String> _days = ['monday.png','tuesday.png','wednesday.png','thursday.png',
    'friday.png','saturday.png','sunday.png'];
  //could nto find any icons in flutter so downlaoded from https://icons8.com/icons/set/weekday

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(30, 20, 20, 0),
        height: widget.height * .9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Add Alarm',
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, null);
                    //back to No alarms Set Screen
                  },
                  child: Icon(
                    Icons.close,
                    size: 40,
                  ),
                )
              ],
            ),
            _createData(),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Day of Week',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            _buildDaysList(),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(10),
                onPressed: () {
                  _submit(widget.manager);
                },
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text(
                  'ADD ALARMS',
                  style: TextStyle(fontSize: 30,),
                ),
              ),
            ),
          ],
        ));
  }


  Widget _buildDays(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: 120,
        width: 120,

        child: Image.asset('assets/images/' + _days[index]),
      ),
    );
  }
  Widget _buildDaysList() {
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _days.asMap().entries
            .map((MapEntry map) => _buildDays(map.key)).toList(),
      ),
    );
  }
  Form _createData() {
    TextStyle labelsStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 25);
    return Form(
      key: _createKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            style: TextStyle(fontSize: 25),
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            validator: (input) => (input.length < 5) ? 'Name is short' : null,
            onSaved: (input) => _name = input,
          ),
          TextFormField(
            style: TextStyle(fontSize: 25),
            decoration: InputDecoration(
              labelText: 'Time 00:00 am/pm and discription',
            ),
            validator: (input) => (input.length > 50) ? 'Discription is long' : null,
            onSaved: (input) => _disc = input,
          )
        ],
      ),
    );
  }

  void _submit(NotificationManager manager) async {
    if (_createKey.currentState.validate()) {
      _createKey.currentState.save();
      print(_name);
      print(_disc);
      //showDatePicker(
         // context: context,
          //initialDate: ,
         // firstDate: null,
          //lastDate: null)
      //couldnt get datepicker working
      showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
      ).then((selectedTime) async {
        int hour = selectedTime.hour;
        int minute = selectedTime.minute;
        print(selectedTime);
        var AlarmId = await widget._database.insertAlarm(
            AlarmsTableData(name: _name,discription: _disc,
                image: 'assets/images/' + _days[_selectIndex]));
        manager.showNotificationDaily(AlarmId, _name, _disc, hour, minute);
        Navigator.pop(context, AlarmId);
      });
    }
  }


}

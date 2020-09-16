import 'package:flutter/material.dart';

class AlarmEmptyState extends StatelessWidget {
  const AlarmEmptyState({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            //list of icons https://api.flutter.dev/flutter/material/Icons-class.html
            Icons.alarm,
            color: Colors.black54,
            size: 90.0,
          ),
          SizedBox(height: 10),
          Text(
            'No Alarms Set',
            style: TextStyle(fontSize: 30),
          )
        ],
      )
    );
  }
}

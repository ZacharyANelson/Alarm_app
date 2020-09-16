import 'package:flutter/material.dart';
//https://flutter.dev/docs/development/ui/widgets-intro
class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
    @required this.blueColor,
  }) : super(key: key);

  final Color blueColor;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      color: blueColor,
      width: double.maxFinite,
      padding: EdgeInsets.all(25),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            'Alarms',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,
              fontSize: deviceWidth * .085,),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:AlarmApp/AppBar.dart';
import 'package:AlarmApp/AlarmEmptyState.dart';

import 'package:AlarmApp/database/moor_database.dart';
import 'package:AlarmApp/notifications/NotificationManager.dart';

void main() {


  testWidgets('Here is test case title content', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('No Alarms Set'),
      ),
    ));

    expect(find.text('No Alarms Set'), findsOneWidget);
  });


  testWidgets('should render success Appbar Widget basic',(WidgetTester tester) async {
    await tester.pumpWidget(AppBar());


    await tester.enterText(find.byType(TextField), 'yourname');


    expect(find.text('hi'), findsOneWidget);
  });
}

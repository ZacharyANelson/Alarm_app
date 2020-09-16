// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


import 'package:AlarmApp/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());


    await tester.tap(find.byIcon(Icons.add_alarm));
    await tester.pump();

    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Discription'), findsOneWidget);
    expect(find.text('Day of Week'), findsOneWidget);
  });
}

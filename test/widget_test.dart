// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xylophone/main.dart';

void main() {
  testWidgets('XylophoneApp smoke test', (WidgetTester tester) async {
    final keyWidgetButton = FlatButton();

    // Build our app and trigger a frame.
    await tester.pumpWidget(XylophoneApp());

    // Build with all 8 key notes
    expect(find.text('C'), findsNWidgets(2));
    expect(find.text('D'), findsOneWidget);
    expect(find.text('E'), findsOneWidget);
    expect(find.text('F'), findsOneWidget);
    expect(find.text('G'), findsOneWidget);
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugas_4/main.dart';

void main() {
  testWidgets('Check if welcome text is displayed',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the welcome message is displayed.
    expect(find.text('Welcome,'), findsOneWidget);
    expect(find.text('2211104002 - Ahmad Junaidi'), findsOneWidget);
  });

  testWidgets('Check if the green circle is displayed',
      (WidgetTester tester) async {
    // Build/ our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the green circle is displayed.
    expect(find.byType(CircleAvatar), findsOneWidget);
  });

  testWidgets('Check if the purple square is displayed',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the purple square is displayed.
    expect(
        find.byWidgetPredicate(
            (widget) => widget is Container && widget.color == Colors.purple),
        findsOneWidget);
  });
}

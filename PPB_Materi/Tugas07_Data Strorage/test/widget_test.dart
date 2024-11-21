// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shared_preferences_demo/main.dart';

void main() {
  testWidgets('HomePage displays input fields and buttons',
      (WidgetTester tester) async {
    // Build the HomePage widget.
    await tester.pumpWidget(const MyApp());

    // Verify that the input fields and buttons are present.
    expect(find.byType(TextField), findsNWidgets(3)); // 3 text fields
    expect(find.text('Save Data'), findsOneWidget); // Button to save data
    expect(
        find.text('Go to Details Page'), findsOneWidget); // Button to navigate
  });

  testWidgets('DetailsPage shows default text if no data saved',
      (WidgetTester tester) async {
    // Simulate navigation to DetailsPage.
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Go to Details Page'));
    await tester.pumpAndSettle();

    // Verify that default values are shown in DetailsPage.
    expect(find.text('Name: No name'), findsOneWidget);
    expect(find.text('NIM: No NIM'), findsOneWidget);
    expect(find.text('Class: No class'), findsOneWidget);
  });
}

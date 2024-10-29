// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pertemuan_7/main.dart';

void main() {
  testWidgets('Product list screen loads successfully',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the product list screen is displayed.
    expect(find.text('Products'), findsOneWidget);

    // Verify that the first product appears on the screen.
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('\$99.99'), findsOneWidget);
  });

  testWidgets('Product detail screen opens on product tap',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Tap the first product in the list.
    await tester.tap(find.text('Product 1'));
    await tester.pumpAndSettle();

    // Verify that the product detail screen is displayed with the correct details.
    expect(find.text('Product 1'), findsWidgets); // Finds in AppBar and Body
    expect(find.text('\$99.99'), findsOneWidget);
    expect(find.text('This is the description for Product 1.'), findsOneWidget);
  });
}

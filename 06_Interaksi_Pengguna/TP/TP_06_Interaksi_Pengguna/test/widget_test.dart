import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas5_advance_layout/main.dart'; // Pastikan import ini sesuai dengan nama aplikasi Anda.

void main() {
  testWidgets('Test bottom navigation bar and page view',
      (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that initially the Home page is displayed.
    expect(find.text('Home page'), findsOneWidget);
    expect(find.text('Email page'), findsNothing);
    expect(find.text('Profile page'), findsNothing);

    // Tap the 'Email' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.email));
    await tester.pumpAndSettle();

    // Verify that the Email page is displayed.
    expect(find.text('Home page'), findsNothing);
    expect(find.text('Email page'), findsOneWidget);
    expect(find.text('Profile page'), findsNothing);

    // Tap the 'Profile' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();

    // Verify that the Profile page is displayed.
    expect(find.text('Home page'), findsNothing);
    expect(find.text('Email page'), findsNothing);
    expect(find.text('Profile page'), findsOneWidget);

    // Tap the 'Home' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();

    // Verify that the Home page is displayed again.
    expect(find.text('Home page'), findsOneWidget);
    expect(find.text('Email page'), findsNothing);
    expect(find.text('Profile page'), findsNothing);
  });
}

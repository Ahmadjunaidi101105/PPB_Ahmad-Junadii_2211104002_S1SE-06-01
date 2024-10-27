import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tp_navigasi/main.dart';

void main() {
  testWidgets('Form submission test', (WidgetTester tester) async {
    // Buat instance UserData
    final userData = UserData();

    // Build our app and trigger a frame
    await tester.pumpWidget(MyApp(userData: userData));

    // Test tab navigation
    expect(find.text('Beranda'), findsOneWidget);
    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Buttons'), findsOneWidget);

    // Test form fields existence
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Test form submission
    await tester.enterText(
        find.widgetWithText(TextField, 'Masukkan Nama'), 'John Doe');
    await tester.enterText(
        find.widgetWithText(TextField, 'Masukkan Email'), 'john@example.com');

    // Tap submit button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify snackbar appears
    expect(find.text('Data berhasil disimpan'), findsOneWidget);

    // Navigate to Menu tab
    await tester.tap(find.text('Menu'));
    await tester.pumpAndSettle();

    // Verify data appears in Menu tab
    expect(find.text('Nama: John Doe'), findsOneWidget);
    expect(find.text('Email: john@example.com'), findsOneWidget);
  });

  testWidgets('Button example test', (WidgetTester tester) async {
    final userData = UserData();
    await tester.pumpWidget(MyApp(userData: userData));

    // Navigate to Buttons tab
    await tester.tap(find.text('Buttons'));
    await tester.pumpAndSettle();

    // Verify buttons exist
    expect(find.text('Elevated Button'), findsOneWidget);
    expect(find.text('Text Button'), findsOneWidget);
    expect(find.text('Pilih Opsi'), findsOneWidget);

    // Test dropdown
    expect(find.byType(DropdownButton), findsOneWidget);
  });
}

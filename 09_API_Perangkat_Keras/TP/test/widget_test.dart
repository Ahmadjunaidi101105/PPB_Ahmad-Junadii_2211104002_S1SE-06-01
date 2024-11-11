import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tp_09/main.dart';

void main() {
  testWidgets('Memuat halaman utama aplikasi', (WidgetTester tester) async {
    // Build aplikasi dan trigger frame.
    await tester.pumpWidget(MyApp());

    // Verifikasi apakah terdapat teks judul "Latihan Memilih Gambar".
    expect(find.text('Latihan Memilih Gambar'), findsOneWidget);

    // Verifikasi apakah terdapat ikon gambar awal (image_outlined).
    expect(find.byIcon(Icons.image_outlined), findsOneWidget);

    // Verifikasi apakah tombol "Camera" dan "Gallery" ada.
    expect(find.text('Camera'), findsOneWidget);
    expect(find.text('Gallery'), findsOneWidget);

    // Verifikasi apakah tombol "Hapus Gambar" ada.
    expect(find.text('Hapus Gambar'), findsOneWidget);
  });
}

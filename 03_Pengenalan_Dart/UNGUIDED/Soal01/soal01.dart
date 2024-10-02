import 'dart:io'; // Untuk menerima input dari user

// Fungsi untuk menentukan nilai
String cekNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "Nilai C";
  } else {
    return ""; // Mengembalikan teks kosong jika kondisi tidak terpenuhi
  }
}

void main() {
  // Menerima input nilai dari user
  stdout.write('Masukkan nilai: ');
  int? nilai = int.parse(stdin.readLineSync()!); // Parsing input ke integer

  // Mendapatkan hasil berdasarkan nilai input
  String hasil = cekNilai(nilai);

  // Mengecek jika hasil bukan string kosong
  if (hasil.isNotEmpty) {
    print('$nilai merupakan $hasil');
  } else {
    print('Nilai tidak valid');
  }
}

import 'dart:io';

// Fungsi untuk mengecek nilai dan mengembalikan grade
String cekNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "Nilai C";
  } else {
    return ""; // Mengembalikan teks kosong jika tidak memenuhi semua kondisi
  }
}

void main() {
  // Meminta input dari user
  stdout.write("Masukkan nilai: ");
  int nilai = int.parse(stdin.readLineSync()!);

  // Menampilkan hasil pengecekan nilai
  String hasil = cekNilai(nilai);
  if (hasil != "") {
    print("$nilai merupakan $hasil");
  } else {
    print("Nilai tidak valid");
  }
}

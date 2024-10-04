import 'dart:io';

void main() {
  // Meminta input tinggi piramida dari user
  stdout.write("Masukkan tinggi piramida: ");
  int tinggi = int.parse(stdin.readLineSync()!);

  // Membuat piramida menggunakan perulangan for
  for (int i = 1; i <= tinggi; i++) {
    // Cetak spasi di awal untuk membuat bentuk piramida
    for (int j = 1; j <= tinggi - i; j++) {
      stdout.write(" ");
    }

    // Cetak bintang untuk setiap baris
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }

    // Pindah ke baris berikutnya
    print("");
  }
}

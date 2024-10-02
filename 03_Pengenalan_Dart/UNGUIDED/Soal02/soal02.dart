import 'dart:io';

void main() {
  print('Masukkan tinggi piramida: ');
  int tinggi = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= tinggi; i++) {
    // Cetak spasi di awal untuk membuat bentuk piramida
    for (int j = tinggi - i; j >= 1; j--) {
      stdout.write(' '); // Menggunakan stdout.write agar tidak pindah baris
    }

    // Cetak bintang
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write('*'); // Menggunakan stdout.write agar tidak pindah baris
    }

    // Pindah ke baris berikutnya setelah satu baris piramida selesai
    print('');
  }
}

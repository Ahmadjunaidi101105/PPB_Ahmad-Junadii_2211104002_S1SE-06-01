import 'dart:io';

bool cekBilanganPrima(int angka) {
  if (angka < 2) {
    return false; // Bilangan kurang dari 2 bukan bilangan prima
  }

  for (int i = 2; i <= angka ~/ 2; i++) {
    if (angka % i == 0) {
      return false; // Jika habis dibagi i, bukan bilangan prima
    }
  }

  return true; // Jika tidak ditemukan faktor selain 1 dan angka itu sendiri
}

void main() {
  // Meminta input bilangan dari user
  stdout.write("Masukkan bilangan: ");
  int angka = int.parse(stdin.readLineSync()!);

  // Mengecek apakah bilangan tersebut prima atau bukan
  if (cekBilanganPrima(angka)) {
    print("$angka adalah bilangan prima");
  } else {
    print("$angka bukan bilangan prima");
  }
}

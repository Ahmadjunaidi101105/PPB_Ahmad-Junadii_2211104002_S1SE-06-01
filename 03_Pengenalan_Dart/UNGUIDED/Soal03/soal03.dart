import 'dart:io';

// Fungsi untuk mengecek apakah bilangan adalah bilangan prima
bool isPrime(int number) {
  if (number <= 1) {
    return false; // Bilangan kurang dari atau sama dengan 1 bukan bilangan prima
  }

  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) {
      return false; // Jika ada pembagi, maka bukan bilangan prima
    }
  }

  return true; // Jika tidak ada pembagi, maka bilangan prima
}

void main() {
  // Meminta input dari pengguna
  print('Masukkan bilangan bulat: ');
  int number = int.parse(stdin.readLineSync()!);

  // Mengecek dan menampilkan apakah bilangan tersebut prima atau bukan
  if (isPrime(number)) {
    print('$number merupakan bilangan prima');
  } else {
    print('$number bukan bilangan prima');
  }
}

// Soal 1
// import 'dart:math';
// import 'dart:io';

// void buatMatriks(int A, int B) {
//   // Membuat matriks A x B dengan nilai acak
//   List<List<int>> matriks = List.generate(A, (i) => List.generate(B, (j) => Random().nextInt(10) + 1));

//   // Menampilkan matriks asli
//   print("\nMatriks ${A}x${B}:");
//   for (var baris in matriks) {
//     print(baris.join(' '));
//   }

//   // Menampilkan transpose matriks
//   print("\nHasil Transpose:");
//   for (int j = 0; j < B; j++) {
//     String row = ""; // Variable untuk menyimpan setiap baris transpose
//     for (int i = 0; i < A; i++) {
//       row += '${matriks[i][j]} '; // Menambahkan elemen ke dalam string row
//     }
//     print(row.trim()); // Cetak setiap baris setelah semua elemen ditambahkan
//   }
// }

// void main() {
//   // Meminta input ukuran matriks A dan B dari user
//   stdout.write("Masukkan jumlah baris (A): ");
//   int A = int.parse(stdin.readLineSync()!);
  
//   stdout.write("Masukkan jumlah kolom (B): ");
//   int B = int.parse(stdin.readLineSync()!);

//   // Memanggil fungsi buatMatriks dengan ukuran yang diinputkan
//   buatMatriks(A, B);
// }

// Soal 2
// import 'dart:io';

// void cariBilangan(int target) {
//   // Membuat List 2 dimensi sesuai deskripsi
//   List<List<int>> matrix = [
//     // Baris 1: 3 bilangan kelipatan 5
//     [5, 10, 15],
//     // Baris 2: 4 bilangan genap
//     [2, 4, 6, 8],
//     // Baris 3: 5 bilangan kuadrat dari 1
//     [1, 4, 9, 16, 25],
//     // Baris 4: 6 bilangan asli mulai dari 3
//     [3, 4, 5, 6, 7, 8],
//   ];

//   // Menampilkan isi matrix
//   print("Isi List:");
//   for (var row in matrix) {
//     print(row.join(' '));
//   }

//   // Mencari bilangan di dalam List
//   bool found = false;
//   for (int i = 0; i < matrix.length; i++) {
//     for (int j = 0; j < matrix[i].length; j++) {
//       if (matrix[i][j] == target) {
//         if (!found) {
//           print("\nBilangan yang dicari: $target");
//           found = true; // Jika bilangan ditemukan, set found menjadi true
//         }
//         print("Bilangan $target berada di: baris ${i + 1}, kolom ${j + 1}");
//       }
//     }
//   }

//   if (!found) {
//     print("\nBilangan $target tidak ditemukan.");
//   }
// }

// void main() {
//   // Meminta input dari user
//   stdout.write("Masukkan bilangan yang ingin dicari: ");
//   int bilangan = int.parse(stdin.readLineSync()!);

//   // Memanggil fungsi untuk mencari bilangan
//   cariBilangan(bilangan);
// }

// Soal 3
import 'dart:io';

int hitungKPK(int a, int b) {
  int maxVal = (a > b) ? a : b;

  // Mencari KPK dengan mencoba kelipatan terbesar hingga menemukan kelipatan yang dapat dibagi oleh keduanya
  while (true) {
    if (maxVal % a == 0 && maxVal % b == 0) {
      return maxVal;
    }
    maxVal++;
  }
}

void main() {
  // Meminta input dari user
  print("Masukkan bilangan pertama: ");
  int bil1 = int.parse(stdin.readLineSync()!);

  print("Masukkan bilangan kedua: ");
  int bil2 = int.parse(stdin.readLineSync()!);

  // Menghitung dan menampilkan hasil KPK
  int kpk = hitungKPK(bil1, bil2);
  print("KPK dari $bil1 dan $bil2 = $kpk");
}


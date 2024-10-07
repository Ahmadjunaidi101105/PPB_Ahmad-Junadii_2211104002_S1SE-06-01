// A. Variable
// • Variabel dengan var
void main() {
  // Menggunakan var
  var name = "Alice"; // Tipe data String
  var age = 25; // Tipe data Integer

  print("Nama: $name, Usia: $age");

  // Type Annotation
  String newName = "Bob"; // Tipe data String
  int newAge = 30; // Tipe data Integer
  print("Nama: $newName, Usia: $newAge");

  // Multiple variable
  String firstName, lastName; // Tipe data String
  firstName = "Charlie";
  lastName = "Brown";
  print("Nama Lengkap: $firstName $lastName");

  // B. Statement Control
  var openHours = 8;
  var closedHours = 21;
  var now = 17;
  if (now > openHours && now < closedHours) {
    print("Hello, we're open");
  } else {
    print("Sorry, we've closed");
  }

  // Switch-Case Statement
  var day = 3; // Misalkan 1 = Senin, 2 = Selasa, dst.
  switch (day) {
    case 1:
      print("Senin");
      break;
    case 2:
      print("Selasa");
      break;
    case 3:
      print("Rabu");
      break;
    case 4:
      print("Kamis");
      break;
    case 5:
      print("Jumat");
      break;
    case 6:
      print("Sabtu");
      break;
    case 7:
      print("Minggu");
      break;
    default:
      print("Hari tidak valid");
  }

  // C. Looping
  // For Loops
  for (int i = 1; i <= 5; i++) {
    print(i);
  }

  // While Loops
  int j = 1; // Deklarasi variabel
  // While loop sederhana
  while (j <= 5) {
    print(j);
    j++; // Tambahkan 1 ke j setelah setiap iterasi
  }

  // D. List
  // Fixed Length List
  List<int> fixedList = List.filled(3, 0);
  fixedList[0] = 10;
  fixedList[1] = 20;
  fixedList[2] = 30;
  print(fixedList);

  // Growable List
  List<int> growableList = [];
  growableList.add(10);
  growableList.add(20);
  growableList.add(30);
  print(growableList); // Output: [10, 20, 30]
  growableList.add(40);
  growableList.add(50);
  print(growableList); // Output: [10, 20, 30, 40, 50]
  growableList.remove(20);
  print(growableList); // Output: [10, 30, 40, 50]

  // E. Fungsi
  // Mengembalikan Nilai
  String sapaan(String nama) {
    return "Halo, $nama!";
  }

  String pesan = sapaan("Dart");
  print(pesan); // Output: Halo, Dart!

  // Menambahkan Parameter
  void greet(String name, int age) {
    print('Hello $name, you are $age years old.');
  }

  greet('Alice', 25);
}

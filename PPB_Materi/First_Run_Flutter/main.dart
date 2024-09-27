void main() {
  List<Map<String, dynamic>> daftarMahasiswa = [
    {
      "nama": "John Doe",
      "ipk": 3.88,
      "isMarried": false,
    },
    {
      "nama": "Andi Doe",
      "ipk": 3.78,
      "isMarried": true,
    },
    {
      "nama": "Budi Doe",
      "ipk": 3.68,
      "isMarried": true,
    }
  ];

  // 1.a. Menghitung rerata dari IPK
  double totalIpk = 0;
  for (var mahasiswa in daftarMahasiswa) {
    totalIpk += mahasiswa['ipk'];
  }
  double rataRataIpk = totalIpk / daftarMahasiswa.length;
  print('Rata-rata IPK: $rataRataIpk');

  // 1.b. Menjumlahkan berapa banyak mahasiswa yang sudah menikah
  int jumlahMenikah = 0;
  for (var mahasiswa in daftarMahasiswa) {
    if (mahasiswa['isMarried']) {
      jumlahMenikah++;
    }
  }
  print('Jumlah mahasiswa yang sudah menikah: $jumlahMenikah');
}

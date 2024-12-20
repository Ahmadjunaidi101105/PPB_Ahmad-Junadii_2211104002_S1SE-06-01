import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            // SliverAppBar dengan latar belakang gambar dan warna yang lebih cerah
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.teal,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
                title: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Wisata di Banyumas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/79/2024/10/09/Tinggalkan-Banyumas-Kota-Hasil-Pemekaran-yang-Memiliki-Kepadatan-Penduduk-2233-per-KM-persegi-Ini-Bakal-Jadi-Wilayah-Terluas-di-Jawa-Tengah-2469702952.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SliverList untuk daftar tempat wisata
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  // Cek apakah index masih dalam batas array
                  if (index < wisataImages.length &&
                      index < wisataTitles.length &&
                      index < wisataDescriptions.length) {
                    return GestureDetector(
                      onTap: () {
                        // Tindakan saat kartu diklik
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(wisataTitles[index]),
                              content: Text(wisataDescriptions[index]),
                              actions: [
                                TextButton(
                                  child: const Text("Tutup"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.teal.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gambar wisata
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.network(
                                wisataImages[index],
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Nama dan Deskripsi Wisata
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    wisataTitles[index],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    wisataDescriptions[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Aksi untuk tombol lebih banyak info
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(wisataTitles[index]),
                                            content: Text(
                                                'Informasi lebih lanjut...'),
                                            actions: [
                                              TextButton(
                                                child: const Text("Tutup"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('Lihat Selengkapnya'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
                childCount: wisataTitles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Daftar gambar wisata
final List<String> wisataImages = [
  'https://img.antaranews.com/cache/800x533/2022/05/03/menara-pandang.jpg.webp',
  'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/803/2023/09/10/FotoJet-8-3700504590.jpg',
  'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/09/2024/10/08/wisata-banyumas-2443733915.jpg',
];

// Daftar title wisata
final List<String> wisataTitles = [
  'Menara Teratai',
  'Curug Bayan',
  'Baturaden',
];

// Daftar deskripsi wisata
final List<String> wisataDescriptions = [
  'Menara Teratai adalah tempat ikonik di Banyumas yang menyajikan pemandangan indah dari ketinggian.',
  'Curug Bayan adalah salah satu air terjun populer di Banyumas dengan suasana yang asri dan alami.',
  'Baturaden adalah destinasi wisata pegunungan dengan udara sejuk dan pemandangan alam yang mempesona.',
];

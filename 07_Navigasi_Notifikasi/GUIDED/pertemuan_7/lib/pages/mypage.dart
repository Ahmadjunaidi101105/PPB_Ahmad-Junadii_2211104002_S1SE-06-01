// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pertemuan_7/models/product.dart';
import 'package:pertemuan_7/pages/detail.dart';

class Mypage extends StatelessWidget {
  Mypage({super.key});

  final List<Product> products = [
    Product(
      id: 1,
      nama: 'mouse',
      harga: 300.000,
      imageUrl:
          'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
      deskripsi: 'mouse adalah tikus, tapi mouse kita bukan kaleng kaleng',
    ),
    Product(
      id: 2,
      nama: 'Keyboard Mechanical',
      harga: 350.000,
      imageUrl:
          'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot',
      deskripsi: 'Keyboard yang paling gacorr',
    ),
    Product(
      id: 3,
      nama: 'Headphone Gaming',
      harga: 700.000,
      imageUrl:
          'https://m.media-amazon.com/images/I/61CGHv6kmWL.AC_UF894,1000_QL80.jpg',
      deskripsi: 'Bassnya rekomended bangett',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Model'),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(
              product.imageUrl,
              width: 70,
              height: 70,
            ),
            title: Text(product.nama),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Harga : Rp${product.harga}'),
                Text(product.deskripsi),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        DetailProduct(data: 'Ini data dari My page')),
              );
            },
          );
        },
      ),
    );
  }
}

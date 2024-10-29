import 'package:flutter/material.dart';
import 'product.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Mouse',
      price: 30000.0,
      description: 'Mouse optik tahan lama',
      imageUrl:
          'https://asset.kompas.com/crops/CZbtoZGt-Twe0FeCSWAfrNi3wpc=/163x20:1077x630/750x500/data/photo/2022/02/11/6206455eed4fb.jpeg',
    ),
    Product(
      name: 'Keyboard Mechanical',
      price: 350000.0,
      description: 'Keyboard kelas menengah',
      imageUrl:
          'https://altcustoms.com/cdn/shop/products/ninja.jpg?v=1654563797&width=600',
    ),
    Product(
      name: 'Headphone Gaming',
      price: 700000.0,
      description: 'Bass nendang juga, rekomen',
      imageUrl:
          'https://img.id.my-best.com/content_section/choice_component/sub_contents/398b2aae47b989ccd9354756844ae431.png?ixlib=rails-4.3.1&q=70&lossless=0&w=690&fit=max&s=90e154dfdca35ca9ded5ed1a6c91c20c',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('e-commerce'),
        backgroundColor: const Color.fromARGB(255, 47, 184, 25),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.network(
                product.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: \$${product.price.toStringAsFixed(2)}'),
                  Text(product.description),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

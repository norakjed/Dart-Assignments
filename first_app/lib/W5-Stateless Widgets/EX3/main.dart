import 'package:flutter/material.dart';

enum Products { dart, flutter, firebase }

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Products')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(20),
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: ProductCard(product: Products.dart)),
              Expanded(child: ProductCard(product: Products.flutter)),
              Expanded(child: ProductCard(product: Products.firebase)),
            ],
          ),
        ),
      ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  final Products product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String title = '';
    String description = '';
    String imagePath = '';

    // map enum → image + text
    switch (product) {
      case Products.dart:
        title = 'Dart';
        description = 'The best object language';
        imagePath = 'lib/W5-Stateless Widgets/EX3/assets/dart.png';
        break;
      case Products.flutter:
        title = 'Flutter';
        description = 'The best mobile development framework';
        imagePath = 'lib/W5-Stateless Widgets/EX3/assets/flutter.png';
        break;
      case Products.firebase:
        title = 'Firebase';
        description = 'The best cloud database';
        imagePath = 'lib/W5-Stateless Widgets/EX3/assets/firebase.png';
        break;
    }

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image with rounded top corners
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                height: 100,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),

            // text section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

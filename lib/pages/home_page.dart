import 'package:flutter/material.dart';
import 'package:flutter_uts_mobile/models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'Sugar',
        price: 5000,
        imageUrl: 'images/gula.jpg',
        stock: 50,
        rating: 5),
    Item(
        name: 'Salt',
        price: 2000,
        imageUrl: 'images/garam.jpg',
        stock: 50,
        rating: 4),
    // Tambahkan item lainnya
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    item.imageUrl,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Price: \$${item.price.toStringAsFixed(2)}'),
                        Text('Stock: ${item.stock}'),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            Text('Rating: ${item.rating.toStringAsFixed(1)}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

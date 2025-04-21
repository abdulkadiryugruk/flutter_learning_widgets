import 'package:flutter/material.dart';

class ListExampleScreen extends StatelessWidget {
  const ListExampleScreen({super.key});

  final List<String> items = const [
    'Elma',
    'Armut',
    'Muz',
    'Çilek',
    'Karpuz',
    'Kiraz',
    'Ananas',
    'Portakal'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liste Örneği')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          return ListTile(
            leading: const Icon(Icons.food_bank),
            title: Text(items[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(item: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String item;
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$item Detay')),
      body: Center(
        child: Text(
          '$item detayına hoş geldiniz!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BasicWidgetsScreen extends StatelessWidget {
  const BasicWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temel Widgetlar'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.teal[300], // Arka plan rengi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text widget örnekleri
            _buildSectionTitle('Text Widget'),
            const Text(
              'Normal metin',
            ),
            const Text(
              'Kalın metin',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Renkli ve italik metin',
              style: TextStyle(
                color: Colors.blue,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Text(
              'Büyük ve gölgeli metin',
              style: TextStyle(
                fontSize: 24,
                shadows: [
                  Shadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Button örnekleri
            _buildSectionTitle('Button Widgetları'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ElevatedButton'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('TextButton'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('OutlinedButton'),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Icon örnekleri
            _buildSectionTitle('Icon Widgetları'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.favorite, color: Colors.red, size: 30),
                Icon(Icons.star, color: Colors.amber, size: 30),
                Icon(Icons.thumb_up, color: Colors.blue, size: 30),
                Icon(Icons.directions_car, color: Colors.green, size: 30),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Image örnekleri
            _buildSectionTitle('Image Widget'),
            Center(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        size: 60,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('(Görsel Yer Tutucu)'),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Container örnekleri
            _buildSectionTitle('Container Widget'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.yellow, Colors.orange],
                    ),
                    border: Border.all(color: Colors.black, width: 2),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 30),
            
            // Widget ağacını göster butonu
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _showWidgetTree(context),
                icon: const Icon(Icons.account_tree),
                label: const Text('Widget Ağacını Göster'),
              ),
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }

  void _showWidgetTree(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Basic Widgets Ağacı'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Scaffold', style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('├── AppBar'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('└── Body: SingleChildScrollView'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('└── Column'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('├── Text Örnekleri'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('├── Button Örnekleri (Row)'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('├── Icon Örnekleri (Row)'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('├── Image Örneği'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('└── Container Örnekleri (Row)'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kapat'),
          ),
        ],
      ),
    );
  }
}
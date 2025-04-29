import 'package:flutter/material.dart';

class LayoutWidgetsScreen extends StatelessWidget {
  const LayoutWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layout Widgetları')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row örneği
            _buildSectionTitle('Row Widget (Yatay Düzen)'),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildColorBox(Colors.red),
                  _buildColorBox(Colors.green),
                  _buildColorBox(Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColorBox(Colors.purple),
                  _buildColorBox(Colors.orange),
                  _buildColorBox(Colors.teal),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Column örneği
            _buildSectionTitle('Column Widget (Dikey Düzen)'),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildColorBox(Colors.red, width: 100),
                  const SizedBox(height: 8),
                  _buildColorBox(Colors.green, width: 150),
                  const SizedBox(height: 8),
                  _buildColorBox(Colors.blue, width: 200),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Stack örneği
            _buildSectionTitle('Stack Widget (Üst Üste Düzen)'),
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[200],
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 20,
                    child: _buildColorBox(
                      Colors.red.withOpacity(0.7),
                      size: 80,
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 50,
                    child: _buildColorBox(
                      Colors.green.withOpacity(0.7),
                      size: 80,
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 80,
                    child: _buildColorBox(
                      Colors.blue.withOpacity(0.7),
                      size: 80,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Expanded örneği
            _buildSectionTitle('Expanded Widget (Genişleyebilen Düzen)'),
            Container(
              height: 80,
              color: Colors.grey[200],
              child: Row(
                children: [
                  Expanded(flex: 1, child: Container(color: Colors.red)),
                  Expanded(flex: 2, child: Container(color: Colors.green)),
                  Expanded(flex: 1, child: Container(color: Colors.blue)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Wrap örneği
            _buildSectionTitle('Wrap Widget (Sarmal Düzen)'),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildColorChip('Flutter'),
                  _buildColorChip('Dart'),
                  _buildColorChip('Widgets'),
                  _buildColorChip('Layout'),
                  _buildColorChip('UI'),
                  _buildColorChip('Mobile'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Align örneği
            _buildSectionTitle('Align Widget (Hizalama)'),
            Container(
              height: 150,
              color: Colors.grey[200],
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: _buildColorBox(Colors.red, size: 50),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: _buildColorBox(Colors.green, size: 50),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: _buildColorBox(Colors.blue, size: 50),
                    ),
                  ),
                ],
              ),
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

  Widget _buildColorBox(Color color, {double size = 50, double? width}) {
    return Container(
      width: width ?? size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildColorChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }

  void _showWidgetTree(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Layout Widgets Ağacı'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Scaffold',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                    child: Text('├── Row Örnekleri'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('├── Column Örnekleri'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('├── Stack Örnekleri'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('├── Expanded Örnekleri'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('├── Wrap Örnekleri'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('└── Align Örnekleri'),
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

import 'package:flutter/material.dart';

class StatefulExampleScreen extends StatefulWidget {
  const StatefulExampleScreen({super.key});

  @override
  State<StatefulExampleScreen> createState() => _StatefulExampleScreenState();
}

class _StatefulExampleScreenState extends State<StatefulExampleScreen> {
  // Sayaç örneği için değişken
  int _counter = 0;

  // Renk değiştirme örneği için değişken
  Color _boxColor = Colors.blue;

  // Toggle örneği için değişken
  bool _isToggled = false;

  // Slider örneği için değişken
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateful Widget Örnekleri')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Sayaç Örneği (StatefulWidget)'),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Mevcut Sayı: $_counter',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _counter--;
                            });
                          },
                          child: const Text('Azalt'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _counter++;
                            });
                          },
                          child: const Text('Artır'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            _buildSectionTitle('Renk Değiştirme Örneği'),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      color: _boxColor,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildColorButton(Colors.red),
                        _buildColorButton(Colors.green),
                        _buildColorButton(Colors.blue),
                        _buildColorButton(Colors.yellow),
                        _buildColorButton(Colors.purple),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            _buildSectionTitle('Toggle Switch Örneği'),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _isToggled ? 'AÇIK' : 'KAPALI',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _isToggled ? Colors.green : Colors.red,
                      ),
                    ),
                    Switch(
                      value: _isToggled,
                      onChanged: (value) {
                        setState(() {
                          _isToggled = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            _buildSectionTitle('Slider Örneği'),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Değer: ${(_sliderValue * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      value: _sliderValue,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                    LinearProgressIndicator(value: _sliderValue, minHeight: 10),
                  ],
                ),
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

  void _showWidgetTree(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Stateful Widget Ağacı'),
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
                    child: Text('├── Sayaç (Card > Column > Button Row)'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      '├── Renk Değiştirici (Card > Row of Color Buttons)',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('├── Toggle Switch (Card > Row > Switch)'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      '├── Slider (Card > Column > Slider + ProgressBar)',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      '└── Widget Ağacını Göster (ElevatedButton.icon)',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Kapat'),
              ),
            ],
          ),
    );
  }

  Widget _buildColorButton(Color color) {
    return InkWell(
      onTap: () {
        setState(() {
          _boxColor = color;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: _boxColor == color ? Colors.black : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }
}

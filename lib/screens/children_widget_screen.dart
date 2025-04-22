import 'package:flutter/material.dart';

class ThemeSwitcherScreen extends StatefulWidget {
  const ThemeSwitcherScreen({super.key});

  @override
  State<ThemeSwitcherScreen> createState() => _ThemeSwitcherScreenState();
}

class _ThemeSwitcherScreenState extends State<ThemeSwitcherScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final theme = _isDarkMode ? ThemeData.dark() : ThemeData.light();

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tema Değiştirici Örneği'),
          actions: [
            Row(
              children: [
                const Text('🌞 acik'),
                Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                  },
                ),
                const Text('🌙 koyu'),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Merhaba Flutter!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Butona Tıkla'),
              ),
              const SizedBox(height: 16),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.amber,
                alignment: Alignment.center,
                child: const Text(
                  'Bu bir Container',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: const [
                      Icon(Icons.info, color: Colors.blue),
                      SizedBox(width: 10),
                      Text('Bu bir kart içeriğidir.'),
                    ],
                  ),
                ),
              ),
              const Text(
                'Text Widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Bu bir yazı widget’ıdır.'),

              const SizedBox(height: 20),
              const Text(
                'Image Widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.network(
                'https://flutter.dev/images/flutter-logo-sharing.png',
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Row İçindeki Icon ve Text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 10),
                  Text('Favori'),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

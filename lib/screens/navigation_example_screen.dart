import 'package:flutter/material.dart';

class NavigationExampleScreen extends StatelessWidget {
  const NavigationExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigasyon Örneği')),
      body: Center(
        child: Column(  // Column ile butonları dikey sırayla yerleştiriyoruz
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Butonun arka plan rengi
                foregroundColor: Colors.white, // Butonun yazı rengi
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SecondPage()),
                );
              },
              child: const Text('İkinci Sayfaya Git'),
            ),
            SizedBox(height: 16), // Butonlar arasında boşluk bırakmak için
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ThirdPage()),
                );
              },
              child: const Text('Üçüncü Sayfaya Git'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('İkinci Sayfa')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Geri Dön'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('İkinci Sayfa')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Geri Dön'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [rowKisim(), Expanded(child: columnKisim())],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Butona tıklandığında yapılacak işlem
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.alarm),
      ),
    );
  }

  Row rowKisim() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        containerOlusturma('D', Colors.red.shade200),
        containerOlusturma('A', Colors.red.shade300),
        containerOlusturma('R', Colors.red.shade400),
        containerOlusturma('T', Colors.red.shade500),
      ],
    );
  }

  Column columnKisim() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        containerOlusturma('E', Colors.red.shade300),
        containerOlusturma('R', Colors.red.shade400),
        containerOlusturma('S', Colors.red.shade500),
        containerOlusturma('L', Colors.red.shade600),
        containerOlusturma('E', Colors.red.shade700),
        containerOlusturma('R', Colors.red.shade800),
        containerOlusturma('I', Colors.red.shade900),
      ],
    );
  }

  Container containerOlusturma(String harf, Color renk) {
    return Container(
      width: 50,
      height: 50,
      color: renk,
      child: Center(
        child: Text(
          harf,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

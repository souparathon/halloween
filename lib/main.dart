import 'package:flutter/material.dart';
import 'dart:math';
//G.Hari Surya Bharadwaj
//LillyMasie
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  final List<String> _items = ['skull', 'candycorn', 'pumpkin'];
  String _correctItem = 'pumpkin';
  String _message = '';
  bool _gameOver = false;

  void _onItemTap(String item) {
    setState(() {
      if (item == _correctItem) {
        _message = 'You Found It!';
        _gameOver = true;
      } else {
        _message = 'Boo! Try Again!';
      }
    });
  }

  Widget _buildItem(String item) {
    return GestureDetector(
      onTap: () => _onItemTap(item),
      child: Image.asset(
        'assets/$item.png',
        width: 100,
        height: 100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halloween Game')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: _items.map((item) => _buildItem(item)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

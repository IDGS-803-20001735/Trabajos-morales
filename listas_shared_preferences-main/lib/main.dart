import 'package:flutter/material.dart';
import 'package:listas_shared_preferences/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Lista de Elementos'),
      color: Colors.orange,
      debugShowCheckedModeBanner: false,
    );
  }
}

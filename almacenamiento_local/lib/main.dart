import 'package:flutter/material.dart';
import 'package:almacenamiento_local/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: '06. Listas - Shared Preferences'),
      color: Colors.green,
      debugShowCheckedModeBanner: false,
    );
  }
}

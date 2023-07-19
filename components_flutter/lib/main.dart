import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "A",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Definición"),
              leading: Icon(Icons.people),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
              iconColor: Colors.green,
            ),
            Divider(
              height: 10,
              color: Colors.black,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text(
                "B",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              height: 10,
              color: Colors.black,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text(
                "C",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              height: 10,
              color: Colors.black,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ));
  }
}

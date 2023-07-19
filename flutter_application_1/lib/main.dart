import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 List arr = ["Nepomuceno", "Eudemofio", "Petronila", "Pánfila", "Jelipe"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista'),
        ),
        body: ListView.builder(
          itemCount: arr.length,
          itemBuilder: (context, index){
             return ListTile(
              onTap: (){
                setState(() {
                  arr.remove(arr[index]);
                });
              },
              title: Text(arr[index]),
              leading: CircleAvatar(child: Text(arr[index].substring(0,1))),
              trailing: Icon(Icons.arrow_forward_ios),
             );
          },
        ),
      ),
    );
  }
}
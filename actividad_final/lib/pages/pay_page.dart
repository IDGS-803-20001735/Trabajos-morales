import 'package:flutter/material.dart';
import 'package:actividad_final/services/firebase_service.dart';

class Pay extends StatefulWidget {
  const Pay({
    Key? key,
  }) : super(key: key);

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MENÚ DE TARTAS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF0033),
      ),
      body: FutureBuilder(
          future: getPays(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.cake_outlined,
                          color: Color(0xFFFF0033),
                        ),
                        title: Text(
                          snapshot.data?[index]['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}

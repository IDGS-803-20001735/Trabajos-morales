import 'package:actividad_final/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddPaysPage extends StatefulWidget {
  const AddPaysPage({super.key});

  @override
  State<AddPaysPage> createState() => __AddPaysPageState();
}

class __AddPaysPageState extends State<AddPaysPage> {
  TextEditingController payController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        title: const Text(
          'AGREGAR PAY',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: payController,
              decoration: InputDecoration(
                hintText: 'Ingresa el nuevo pay'.toUpperCase(),
                hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                await addPay(payController.text).then((_) {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Registro guardado correctamente'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Color(0xFF00FF99),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF000000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'GUARDAR',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

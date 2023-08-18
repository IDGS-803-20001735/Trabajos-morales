import 'package:actividad_final/services/employ_service.dart';
import 'package:flutter/material.dart';

class AddEmploysPage extends StatefulWidget {
  const AddEmploysPage({super.key});

  @override
  State<AddEmploysPage> createState() => __AddEmploysPageState();
}

class __AddEmploysPageState extends State<AddEmploysPage> {
  TextEditingController employController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        title: const Text(
          'AGREGAR EMPLEADO',
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
              controller: employController,
              decoration: InputDecoration(
                hintText: 'Registra un nuevo empleado'.toUpperCase(),
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
                await addEmploy(employController.text).then((_) {
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

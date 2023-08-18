import 'package:actividad_final/services/employ_service.dart';
import 'package:flutter/material.dart';

class EditEmploysPage extends StatefulWidget {
  const EditEmploysPage({super.key});

  @override
  State<EditEmploysPage> createState() => __EditEmploysPageState();
}

class __EditEmploysPageState extends State<EditEmploysPage> {
  TextEditingController employController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    employController.text = arguments['name'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        title: const Text(
          'ACTUALIZAR EMPLEADO',
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
                hintText: 'Ingresa la edición correspondiente'.toUpperCase(),
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
                await updateEmploy(arguments["uid"], employController.text)
                    .then((_) {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Registro actualizado correctamente'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Color.fromARGB(205, 242, 242, 13),
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
                'ACTUALIZAR',
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

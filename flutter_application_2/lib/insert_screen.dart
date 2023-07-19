import 'package:flutter/material.dart';
import 'package:flutter_application_2/snackbars.dart';
import 'package:flutter_application_2/view_model.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final vm = view_model();
  void _navigateToCreateScreen() async {
    await vm.navigateToMain(context);
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _fetchRecords() async {
    List<Map<String, dynamic>> records = await vm.fetch();
    setState(() {
      _nameController.clear();
      _descriptionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INSERTAR NUEVO REGISTRO'),
        backgroundColor: Color(0xFF000000),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'NOMBRE',
                  hintStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  fillColor: Color(0xFFE5E8E8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'DESCRIPCIÓN',
                  hintStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  fillColor: Color(0xFFE5E8E8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (_nameController.text.isEmpty ||
                    _descriptionController.text.isEmpty) {
                  SnackbarUtils.showErrorSnackbar(
                    context,
                    'Por favor, ingrese un nombre y una descripción',
                  );
                } else {
                  bool insercion = await vm.insertRecord(
                    _nameController.text,
                    _descriptionController.text,
                  );
                  if (insercion) {
                    SnackbarUtils.showCompletedSnackbar(
                      context,
                      'Registro creado correctamente',
                    );
                    _fetchRecords();
                    _navigateToCreateScreen();
                  } else {
                    SnackbarUtils.showErrorSnackbar(
                      context,
                      'Error al crear el registro',
                    );
                  }
                }
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF000000)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Text(
                'GUARDAR',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

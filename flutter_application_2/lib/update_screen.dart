import 'package:flutter/material.dart';
import 'package:flutter_application_2/view_model.dart';

import 'alertas.dart';
import 'snackbars.dart';

class EditScreen extends StatefulWidget {
  final Map<String, dynamic> record;

  EditScreen({required this.record});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final vm = view_model();

  void _navigateToMain() async {
    await vm.navigateToMain(context);
  }

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  TextEditingController _nameControllerNew = TextEditingController();
  TextEditingController _descriptionControllerNew = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.record['name']);
    _descriptionController =
        TextEditingController(text: widget.record['description']);
    _nameControllerNew.text = widget.record['name'];
    _descriptionControllerNew.text = widget.record['description'];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _nameControllerNew.dispose();
    _descriptionControllerNew.dispose();
    super.dispose();
  }

  Future<void> _fetchRecords() async {
    List<Map<String, dynamic>> records = await vm.fetch();
    setState(() {
      _nameController.clear();
      _descriptionController.clear();
      _nameControllerNew.clear();
      _descriptionControllerNew.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Build your edit screen UI using the controllers
    // Example:
    return Scaffold(
      appBar: AppBar(
        title: Text('EDITAR REGISTRO'),
        backgroundColor: Color(0xFF000000),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Nombre: ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      _nameController.text,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Descripción: ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      _descriptionController.text,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _nameControllerNew,
            decoration: InputDecoration(
                filled: true,
                labelText: 'NUEVO NOMBRE',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                fillColor: Color(0xFFE5E8E8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                )),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _descriptionControllerNew,
            decoration: InputDecoration(
                filled: true,
                labelText: 'NUEVA DESCRIPCIÓN',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                fillColor: Color(0xFFE5E8E8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                )),
          ),
          ElevatedButton(
            onPressed: () {
              if (_nameControllerNew.text.isEmpty ||
                  _descriptionControllerNew.text.isEmpty) {
                SnackbarUtils.showErrorSnackbar(
                  context,
                  'Por favor, ingrese un nombre y una descripción',
                );
              } else {
                AlertUtils.showEditConfirmation(context, () async {
                  bool actualizacion = await vm.updateRecord(
                    widget.record['id'],
                    _nameControllerNew.text,
                    _descriptionControllerNew.text,
                  );
                  if (actualizacion) {
                    vm.showSnackBar(
                      'Registro actualizado correctamente',
                      context,
                    );
                    _fetchRecords();
                    _navigateToMain();
                  } else {
                    vm.showSnackBar('Error al actualizar el registro', context);
                  }
                });
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
              'ACTUALIZAR',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

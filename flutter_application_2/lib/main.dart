import 'package:flutter/material.dart';
import 'package:flutter_application_2/view_model.dart';

import 'alertas.dart';
import 'snackbars.dart';
//import 'database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD con SQLite',
      color: Color(0xFF000000),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final vm = view_model();
  List<Map<String, dynamic>> _records = [];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchRecords();
  }

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
      _records = records;
    });
  }

  void _selectRecord(Map<String, dynamic> record) {
    _nameController.text = record['name'];
    _descriptionController.text = record['description'];
  }

  void _deleteRecord(int recordId) {
    vm.deleteRecord(recordId);
    _fetchRecords();
    SnackbarUtils.showCompletedSnackbar(
        context, 'Registro eliminado correctamente');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD con SQLite'),
        backgroundColor: Color(0xFF000000),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                SnackbarUtils.showInfoSnackbar(
                  context,
                  'Haga clic en algún botón para gestionar los registros',
                );
              },
              child: Container(
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
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        enabled: false,
                        decoration: InputDecoration(
                            filled: true,
                            hintStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            fillColor: Color(0xFFE5E8E8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.0),
            InkWell(
              onTap: () {
                SnackbarUtils.showInfoSnackbar(
                  context,
                  'Haga clic en algún botón para gestionar los registros',
                );
              },
              child: Container(
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
                    Expanded(
                      child: TextField(
                        controller: _descriptionController,
                        enabled: false,
                        decoration: InputDecoration(
                            filled: true,
                            hintStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            fillColor: Color(0xFFE5E8E8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_nameController.text.isEmpty ||
                          _descriptionController.text.isEmpty) {
                        SnackbarUtils.showErrorSnackbar(
                          context,
                          'Por favor, seleccione un registro',
                        );
                      } else if (_records.isNotEmpty) {
                        _navigateToEditScreen(_records.firstWhere(
                          (record) =>
                              record['name'] == _nameController.text &&
                              record['description'] ==
                                  _descriptionController.text,
                          orElse: () => {},
                        ));
                      } else {
                        SnackbarUtils.showErrorSnackbar(
                          context,
                          'No hay registros disponibles',
                        );
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
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_records.isNotEmpty) {
                        Map<String, dynamic> selectedRecord =
                            _records.firstWhere(
                          (record) =>
                              record['name'] == _nameController.text &&
                              record['description'] ==
                                  _descriptionController.text,
                          orElse: () => {},
                        );
                        if (selectedRecord.isNotEmpty) {
                          AlertUtils.showDeleteConfirmation(context, () {
                            _deleteRecord(selectedRecord['id']);
                          });
                        } else {
                          SnackbarUtils.showErrorSnackbar(
                            context,
                            'No se encontró el registro seleccionado',
                          );
                        }
                      } else {
                        SnackbarUtils.showErrorSnackbar(
                          context,
                          'No hay registros disponibles',
                        );
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
                      'ELIMINAR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'REGISTROS:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: _records.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> record = _records[index];
                  return Dismissible(
                    key: Key(record['id'].toString()),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    confirmDismiss: (direction) async {
                      return await AlertUtils.showDeleteConfirmationDismiss(
                        context,
                        '¿Estás seguro de que deseas eliminar este registro?',
                        'Confirmar Eliminación',
                      );
                    },
                    onDismissed: (direction) {
                      _deleteRecord(record['id']);
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(record['name']),
                        subtitle: Text(record['description']),
                        onTap: () {
                          _selectRecord(record);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToCreateScreen,
        backgroundColor: Color(0xFF000000),
        icon: Icon(Icons.add_circle_outline),
        label: Text("AGREGAR REGISTRO",
            style: TextStyle(
              color: Color(0xFFF3E5F5),
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  void _navigateToCreateScreen() async {
    await vm.navigateToCreateScreen(context);
  }

  void _navigateToEditScreen(Map<String, dynamic> record) async {
    await vm.navigateToEditScreen(context, record);
  }
}

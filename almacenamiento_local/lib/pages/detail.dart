import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final String initialValue;
  final String initialValue2;

  EditScreen({required this.initialValue, required this.initialValue2});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _tituloEditingController;
  late TextEditingController _descripcionEditingController;
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    _tituloEditingController = TextEditingController(text: widget.initialValue);
    _descripcionEditingController =
        TextEditingController(text: widget.initialValue2);
  }

  @override
  void dispose() {
    _tituloEditingController.dispose();
    _descripcionEditingController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final newValue = _tituloEditingController.text;
    final newValue2 = _descripcionEditingController.text;
    final values = [newValue, newValue2];
    Navigator.pop(context, values.toString());
  }

  void _selectImage() {
    // Aquí puedes abrir un cuadro de diálogo o utilizar cualquier otro método para seleccionar una imagen
    // En este ejemplo, simplemente estableceremos una URL de imagen de muestra
    setState(() {
      imageUrl = _descripcionEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: imageUrl.isNotEmpty
                  ? Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                    )
                  : Icon(
                      Icons.image,
                      size: 64.0,
                      color: Colors.grey[400],
                    ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectImage,
              child: const Text('Seleccionar imagen'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              autofocus: true,
              controller: _tituloEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Modificar título',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              autofocus: true,
              controller: _descripcionEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Modificar Url de la imagen',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveChanges,
              child: const Text('Actualizar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

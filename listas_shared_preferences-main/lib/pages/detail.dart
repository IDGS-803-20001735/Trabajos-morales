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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Mostrar la imagen seleccionada o una imagen de marcador de posición si no se ha seleccionado ninguna
            if (imageUrl.isNotEmpty)
              Image.asset(
                imageUrl,
                height: 200,
              )
            else
              Placeholder(
                fallbackHeight: 200,
              ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectImage,
              child: const Text('Seleccionar imagen'),
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
            ),
          ],
        ),
      ),
    );
  }
}

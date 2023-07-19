import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:almacenamiento_local/pages/detail.dart';

class datos {
  final String dato;
  final String dato2;

  datos(this.dato, this.dato2);
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [];
  TextEditingController tituloController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadShared();
  }

  Future<void> loadShared() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      items = prefs.getStringList("valores") ?? [];
    });
  }

  Future<void> saveShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('valores', items);
  }

  void _navigateToEditScreen(int index) async {
    final editedItem = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditScreen(
          initialValue: obtenerSubLista(items[index])[0],
          initialValue2: obtenerSubLista(items[index])[1],
        ),
      ),
    );

    if (editedItem != null) {
      setState(() {
        items[index] = editedItem;
        saveShared();
      });
    }
  }

  List<String> obtenerSubLista(String cadena) {
    cadena = cadena.substring(1, cadena.length - 1);
    List<String> subLista = cadena.split(", ");
    return subLista;
  }

  Color generarColorVerde(int index) {
    final int redValue = index * 20;
    final int greenValue = index * 40 + 80;
    final int blueValue = index * 20;
    return Color.fromARGB(255, redValue, greenValue, blueValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ReorderableListView(
                children: <Widget>[
                  for (int index = 0; index < items.length; index += 1)
                    Dismissible(
                      key: UniqueKey(),
                      background: Container(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          items.removeAt(index);
                          saveShared();
                        });
                      },
                      secondaryBackground: Container(
                        color: Colors.green,
                        child: Align(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              Text(
                                ' Borrar',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                      child: Card(
                        color: generarColorVerde(
                            index), // Color de verde generado dinámicamente
                        child: ListTile(
                          key: Key('$index'),
                          title: Text(obtenerSubLista(items[index])[0]),
                          subtitle: Text(obtenerSubLista(items[index])[1]),
                          leading: CircleAvatar(
                            child: Text(
                              obtenerSubLista(items[index])[0].substring(0, 1),
                            ),
                          ),
                          trailing: Wrap(
                            spacing: 5,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _navigateToEditScreen(index);
                                },
                                icon: Icon(Icons.edit),
                                splashRadius: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final item = items.removeAt(oldIndex);
                    items.insert(newIndex, item);
                  });
                  saveShared();
                },
              ),
            ),
          ),
          Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextField(
                  controller: tituloController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Agregar Titulo',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 13.0,
                  right: 13.0,
                  bottom: 13.0,
                ),
                child: TextField(
                  controller: descripcionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Agregar url de la imagen',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 13.0,
                  right: 13.0,
                  bottom: 13.0,
                ),
                child: ElevatedButton(
                  child: Text('Agregar'),
                  onPressed: () {
                    if (tituloController.text.isNotEmpty &&
                        descripcionController.text.isNotEmpty) {
                      setState(() {
                        List<String> data = [];
                        data.add(tituloController.text);
                        data.add(descripcionController.text);
                        items.add(data.toString());
                        tituloController.clear();
                        descripcionController.clear();
                      });
                      saveShared();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

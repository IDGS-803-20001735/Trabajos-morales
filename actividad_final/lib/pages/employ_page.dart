import 'package:actividad_final/services/employ_service.dart';
import 'package:flutter/material.dart';

class Employ extends StatefulWidget {
  const Employ({
    Key? key,
  }) : super(key: key);

  @override
  State<Employ> createState() => _EmployState();
}

class _EmployState extends State<Employ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GESTIÓN DE EMPLEADOS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF000000),
      ),
      body: FutureBuilder(
        future: getEmploys(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ReorderableListView.builder(
              itemCount: snapshot.data != null ? snapshot.data!.length : 0,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = snapshot.data![oldIndex];
                  snapshot.data!.removeAt(oldIndex);
                  snapshot.data!.insert(newIndex, item);
                });
              },
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(snapshot.data?[index]["uid"]),
                  onDismissed: (direction) async {
                    await deleteEmploy(snapshot.data?[index]['uid']);
                    snapshot.data?.removeAt(index);
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;

                    result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "¿Eliminar el: ${snapshot.data?[index]['name']}?",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(
                                  context,
                                  false,
                                );
                              },
                              child: const Text(
                                "CANCELAR",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(
                                  context,
                                  true,
                                );
                              },
                              child: const Text(
                                "ACEPTAR",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    if (result) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Elemento eliminado correctamente"),
                          duration: Duration(seconds: 2),
                          backgroundColor: Color.fromARGB(255, 255, 0, 0),
                        ),
                      );
                    }

                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  child: Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.person_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        snapshot.data?[index]['name'].toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () async {
                        await Navigator.pushNamed(context, "/editEmploy",
                            arguments: {
                              "name": snapshot.data?[index]['name'],
                              "uid": snapshot.data?[index]['uid'],
                            });
                        setState(() {});
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.pushNamed(context, '/addEmploy');
          setState(() {});
        },
        icon: const Icon(Icons.add_circle_outline_sharp),
        backgroundColor: const Color(0xFF000000),
        label: const Text(
          "AGREGAR",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

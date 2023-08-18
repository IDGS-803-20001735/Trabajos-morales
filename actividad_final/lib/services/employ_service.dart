import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// Función para listar registros:
Future<List> getEmploys() async {
  List employs = [];
  QuerySnapshot querySnapshot = await db.collection('employs').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final employ = {
      "name": data["name"],
      "uid": doc.id,
    };
    employs.add(employ);
  }
  return employs;
}

// Función para guardar registro:
Future<void> addEmploy(String name) async {
  await db.collection("employs").add({"name": name});
}

// Función para actualizar registro:
Future<void> updateEmploy(String uid, String newName) async {
  await db.collection("employs").doc(uid).set({"name": newName});
}

// Función para eliminar registro:
Future<void> deleteEmploy(String uid) async {
  await db.collection("employs").doc(uid).delete();
}

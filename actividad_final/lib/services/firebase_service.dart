import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// Función para listar registros:
Future<List> getPays() async {
  List pays = [];
  QuerySnapshot querySnapshot = await db.collection('pays').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final pay = {
      "name": data["name"],
      "uid": doc.id,
    };
    pays.add(pay);
  }
  return pays;
}

// Función para guardar registro:
Future<void> addPay(String name) async {
  await db.collection("pays").add({"name": name});
}

// Función para actualizar registro:
Future<void> updatePay(String uid, String newName) async {
  await db.collection("pays").doc(uid).set({"name": newName});
}

// Función para eliminar registro:
Future<void> deletePay(String uid) async {
  await db.collection("pays").doc(uid).delete();
}

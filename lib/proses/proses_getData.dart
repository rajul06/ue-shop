import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getDataBarangPenampung(userId) async {
  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users = FirebaseFirestore.instance.collection('barang');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot = await users.get();

  // Looping untuk mendapatkan data setiap dokumen pada querySnapshot
  querySnapshot.docs.forEach((doc) {
    print(doc.data());
  });
}

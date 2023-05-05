import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> tambahBarang(db, userId, namaBarang, hargaBarang, kategori,
    deskripsi, beratBarang, jasaPengiriman, metodePembayaran, jenis_akun) {
  // Fungsi tambah barang ke database firestore firebase
  return db
      .collection('barang')
      .doc()
      .set({
        'id_user': userId,
        'nama_barang': namaBarang,
        'harga_barang': hargaBarang,
        'kategori': kategori,
        'deskripsi': deskripsi,
        'berat_barang': beratBarang,
        'jasa_pengiriman': jasaPengiriman,
        'metode_pembayaran': metodePembayaran,
        'jenis_akun': jenis_akun
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future uploadGambarBarang(
    auth, storage, File imageFile, kategori, namaBarang) async {
  // Fungsi untuk mengupload gambar form ke server atau melakukan tindakan lainnya
  User? user = auth.currentUser;
  String imagePath = 'barang_penampung/${user?.uid}/$kategori/$namaBarang.jpg';
  try {
    TaskSnapshot snapshot = await storage.ref(imagePath).putFile(imageFile);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  } on FirebaseException catch (e) {
    print(e);
  }
}

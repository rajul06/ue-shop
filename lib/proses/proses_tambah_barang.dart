import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> tambahBarang(
    auth,
    storage,
    db,
    userId,
    namaBarang,
    kategori,
    deskripsi,
    beratBarang,
    jasaPengiriman,
    metodePembayaran,
    jenisAkun,
    imageFile,
    {hargaBarang = ''}) async {
  var imagePath = await uploadGambarBarang(
      auth, storage, jenisAkun, imageFile, kategori, namaBarang);
  // Fungsi tambah barang ke database firestore firebase
  return db.collection('barang').doc().set({
    'id_user': userId,
    'nama_barang': namaBarang,
    'harga_barang': hargaBarang,
    'kategori': kategori,
    'deskripsi': deskripsi,
    'berat_barang': beratBarang,
    'jasa_pengiriman': jasaPengiriman,
    'metode_pembayaran': metodePembayaran,
    'jenis_akun': jenisAkun,
    'lokasi': 'Banda Aceh',
    'url_download': imagePath,
  }).catchError((error) => print("Failed to add user: $error"));
}

Future uploadGambarBarang(
    auth, storage, jenisAkun, File imageFile, kategori, namaBarang) async {
  // Fungsi untuk mengupload gambar form ke server atau melakukan tindakan lainnya
  User? user = auth.currentUser;
  String imagePath = '$jenisAkun/${user?.uid}/$kategori/$namaBarang.jpg';
  try {
    TaskSnapshot snapshot = await storage.ref(imagePath).putFile(imageFile);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  } on FirebaseException catch (e) {
    print(e);
  }
}

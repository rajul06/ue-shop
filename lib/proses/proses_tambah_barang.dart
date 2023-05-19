import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ue_shop/proses/proses_getData.dart';

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

Future<void> tambahBeliBarang(auth, storage, db, idDokumen, idPembeli,
    {hargaBarang = ''}) async {
  var datas = await getDataSatuBarang(idDokumen);

  await Future.delayed(Duration(seconds: 2));
  var hasil = [];

  var data = {};
  data['idDokumen'] = datas[0]['idDokumen'];
  data['namaBarang'] = datas[0]['namaBarang'];
  data['hargaBarang'] = datas[0]['hargaBarang'];
  data['deskripsi'] = datas[0]['deskripsi'];
  data['berat_barang'] = datas[0]['berat_barang'];
  data['idUser'] = datas[0]['idUser'];
  data['jasaPengiriman'] = datas[0]['jasaPengiriman'];
  data['jenisAkun'] = datas[0]['jenisAkun'];
  data['kategori'] = datas[0]['kategori'];
  data['lokasi'] = datas[0]['lokasi'];
  data['metodePembayaran'] = datas[0]['metodePembayaran'];
  data['urlDownload'] = datas[0]['urlDownload'];
  hasil.add(data);
  tambahBeliBarangKeTemp(db, idDokumen);
}

Future<void> tambahBeliBarangKeTemp(db, idDokumen) async {
  var data = await getDataSatuBarang(idDokumen);

  await Future.delayed(Duration(seconds: 2));
  // Fungsi tambah barang ke database firestore firebase
  db.collection('temp').doc(idDokumen).set({
    'id_user': data[0]['idUser'],
    'nama_barang': data[0]['namaBarang'],
    'harga_barang': data[0]['hargaBarang'],
    'kategori': data[0]['kategori'],
    'deskripsi': data[0]['deskripsi'],
    'berat_barang': data[0]['berat_barang'],
    'jasa_pengiriman': data[0]['jasaPengiriman'],
    'metode_pembayaran': data[0]['metodePembayaran'],
    'jenis_akun': data[0]['jenisAkun'],
    'lokasi': 'Banda Aceh',
    'url_download': data[0]['urlDownload'],
  }).catchError((error) => print("Failed to add user: $error"));
  hapusBarang(idDokumen);
}

Future hapusBarang(idDokumen) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentReference documentReference =
      firestore.collection('barang').doc(idDokumen);

  documentReference.delete().then((_) {
    print('Dokumen berhasil dihapus.');
  }).catchError((error) => print("Terjadi kesalahan: $error"));
}

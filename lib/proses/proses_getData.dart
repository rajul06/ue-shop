import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getDataBarangPenampung() async {
  List hasil = [];
  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users = FirebaseFirestore.instance.collection('barang');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot = await users.get();

  // Looping untuk mendapatkan data setiap dokumen pada querySnapshot
  querySnapshot.docs.forEach((doc) {
    var data = {};
    data['namaBarang'] = doc['nama_barang'];
    data['hargaBarang'] = doc['harga_barang'];
    data['deskripsi'] = doc['deskripsi'];
    data['berat_barang'] = doc['berat_barang'];
    data['idUser'] = doc['id_user'];
    data['jasaPengiriman'] = doc['jasa_pengiriman'];
    data['jenisAkun'] = doc['jenis_akun'];
    data['kategori'] = doc['kategori'];
    data['lokasi'] = doc['lokasi'];
    data['metodePembayaran'] = doc['metode_pembayaran'];
    data['urlDownload'] = doc['url_download'];
    hasil.add(data);
  });
  return hasil;
}

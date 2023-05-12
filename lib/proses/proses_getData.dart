import 'package:cloud_firestore/cloud_firestore.dart';

// Function mengambil data dari firebase firestore dan mengembalikan future instance
Future<List> getDataBarang(jenisAkun) async {
  List hasil = [];
  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users = FirebaseFirestore.instance.collection('barang');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot =
      await users.where('jenis_akun', isEqualTo: jenisAkun).get();

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

Future<List> getDataBarangSatuUser(idUser, jenisAkun) async {
  List hasil = [];
  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users = FirebaseFirestore.instance.collection('barang');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot = await users.get();

  // Looping untuk mendapatkan data setiap dokumen pada querySnapshot
  querySnapshot.docs.forEach((doc) {
    var data = {};
    if (doc['id_user'] == idUser && doc['jenis_akun'] == jenisAkun) {
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
    } else if (doc['id_user'] == idUser && doc['jenis_akun'] == jenisAkun) {
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
    }
  });
  return hasil;
}

Future<List> getDataBarangSearch(querySearch, jenisAkun) async {
  List hasil = [];
  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users = FirebaseFirestore.instance.collection('barang');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot =
      await users.where('jenis_akun', isEqualTo: jenisAkun).get();
  print('-----------------------');

  print('masyarakat' == jenisAkun);
  print(jenisAkun + querySearch);
  print(querySnapshot.docs);
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
    if (data['namaBarang'].toLowerCase().contains(querySearch)) {
      hasil.add(data);
    }
    print(data['namaBarang']);
    print(data['namaBarang'].toLowerCase().contains(querySearch));
  });
  return hasil;
}

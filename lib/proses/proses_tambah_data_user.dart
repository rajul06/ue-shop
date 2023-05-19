import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ue_shop/proses/proses_getData.dart';

Future<void> tambahDataUser(
    auth, storage, db, idUser, namaLengkap, email, password, jenisAkun) async {
  return db.collection('data_user').doc().set({
    'id_user': idUser,
    'nama_lengkap': namaLengkap,
    'email': email,
    'password': password,
    'jenis_akun': jenisAkun
  }).catchError((error) => print("Failed to add user: $error"));
}

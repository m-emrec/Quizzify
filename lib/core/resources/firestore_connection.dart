import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trivia/core/resources/data_state.dart';

abstract class FireStoreConnection {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<DataState> readData(Map? param);
  Future<DataState> deleteData(Map? param);
  Future<DataState> updateData(Map? param);
  Future<DataState> createData(Map? param);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrudMethods {
  // Future<void> addData(blogData) async {
  //   // Firestore.instance.collection("Users").add(blogData).catchError((e) {
  //   //   print(e);
  //   // });
  //   Firestore.instance.collection("Users").snapshots();
  // }

  User user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<void> addUserData({Map<String, dynamic> data}) {
    return users
        .doc(FirebaseAuth.instance.currentUser.uid)
        .set(data)
        .then((value) => print('Добавленные пользователи'))
        .catchError(
            (error) => print('Не удалось добавить пользователя: $error'));
  }

  // getData() async {
  //   return await Firestore.instance.collection("Users").snapshots();
  // }
}


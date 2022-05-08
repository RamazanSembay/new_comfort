import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:new_comfort/models/cart_model.dart';
import 'package:new_comfort/models/favorite_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<FavoriteModel> favoriteList = [];
  FavoriteModel favoriteModel;

  Future getFavoriteData() async {
    List<FavoriteModel> newFavoriteList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Маған ұнағандар')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Маған ұнағандар')
        .get();

    querySnapshot.docs.forEach((element) {
      favoriteModel = FavoriteModel.fromDocument(element);
      notifyListeners();
      newFavoriteList.add(favoriteModel);
    });
    favoriteList = newFavoriteList;
    notifyListeners();
  }

  List<FavoriteModel> get getFavoriteList {
    return favoriteList;
  }
}

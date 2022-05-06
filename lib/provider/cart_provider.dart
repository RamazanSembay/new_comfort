import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_comfort/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> cartList = [];
  CartModel cartModel;

  Future getCartData() async {
    List<CartModel> newCartList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Менің себетім')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Менің себетім')
        .get();

    querySnapshot.docs.forEach((element) {
      cartModel = CartModel.fromDocument(element);
      notifyListeners();
      newCartList.add(cartModel);
    });
    cartList = newCartList;
    notifyListeners();
  }

  List<CartModel> get getCartList {
    return cartList;
  }

  int subTotal() {
    int subtotal = 0;
    cartList.forEach((element) {
      subtotal += element.price * element.quantity;
    });
    return subtotal;
  }

  int subTotal1() {
    int subtotal1 = 0;
    cartList.forEach((element) {
      subtotal1 += element.quantity;
    });
    return subtotal1;
  }
}



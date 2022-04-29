import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String id;
  final String name;
  final String image;
  final int price;
  final int quantity;

  CartModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.quantity,
  });

  factory CartModel.fromDocument(QueryDocumentSnapshot doc) {
    return CartModel(
      id: doc["Id"],
      name: doc["Название"],
      image: doc["Картинка"],
      price: doc["Цена"],
      quantity: doc["Количество"],
    );
  }
}

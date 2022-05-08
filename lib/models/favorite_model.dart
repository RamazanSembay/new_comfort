import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteModel {
  final String id;
  final String name;
  final String image;
  final int price;
  final String model;

  FavoriteModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.model,
  });

  factory FavoriteModel.fromDocument(QueryDocumentSnapshot doc) {
    return FavoriteModel(
      id: doc["Id"],
      name: doc["Название"],
      image: doc["Картинка"],
      price: doc["Цена"],
      model: doc["Модель"],
    );
  }
}


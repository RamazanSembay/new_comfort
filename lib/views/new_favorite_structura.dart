import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

class NewFavoriteStructura extends StatefulWidget {
  @override
  State<NewFavoriteStructura> createState() => _NewFavoriteStructuraState();
}

class _NewFavoriteStructuraState extends State<NewFavoriteStructura> {
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###');

    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff8BCAC0).withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'icon/favorite_1.png',
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.cover,
                                  color: Color(0xff444444),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Маған ұнағандар',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff444444),
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Маған ұнағандар')
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .collection('Маған ұнағандар')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return snapshot.data.docs.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 40,
                              ),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'images/cart_empty.svg',
                                    width: 150,
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    'Ұнаған заттарыңызды салған жоқсыз!',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff444444),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height,
                              width: double.infinity,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  var data = snapshot.data.docs[index];
                                  return FavoriteProduct(
                                    name: data['Название'],
                                    image: data['Картинка'],
                                    price: data['Цена'],
                                    favoriteadd: () {
                                      FirebaseFirestore.instance
                                          .collection('Менің себетім')
                                          .doc(FirebaseAuth
                                              .instance.currentUser.uid)
                                          .collection('Менің себетім')
                                          .doc(data.id)
                                          .set({
                                        'Id': data.id,
                                        'Название': data['Название'],
                                        'Картинка': data['Картинка'],
                                        'Цена': data['Цена'],
                                        'Модель': data['Модель'],
                                        'Количество': 1
                                      });
                                      Get.snackbar(
                                        "Себет",
                                        "Себетке салдым",
                                        icon: Icon(Icons.send,
                                            color: Colors.white),
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Color(0xff444444),
                                        borderRadius: 5,
                                        margin: EdgeInsets.all(15),
                                        colorText: Colors.white,
                                        duration: Duration(seconds: 3),
                                        isDismissible: true,
                                        dismissDirection:
                                            DismissDirection.horizontal,
                                        forwardAnimationCurve:
                                            Curves.easeOutBack,
                                      );
                                    },
                                    favoritedelete: () {
                                      FirebaseFirestore.instance
                                          .collection('Маған ұнағандар')
                                          .doc(FirebaseAuth
                                              .instance.currentUser.uid)
                                          .collection('Маған ұнағандар')
                                          .doc(data.id)
                                          .delete();

                                      Get.snackbar(
                                        "Ұнаған",
                                        "Өшірдім",
                                        icon: Icon(Icons.send,
                                            color: Colors.white),
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Color(0xff444444),
                                        borderRadius: 5,
                                        margin: EdgeInsets.all(15),
                                        colorText: Colors.white,
                                        duration: Duration(seconds: 3),
                                        isDismissible: true,
                                        dismissDirection:
                                            DismissDirection.horizontal,
                                        forwardAnimationCurve:
                                            Curves.easeOutBack,
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FavoriteProduct extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  final int price;

  final Function favoriteadd;
  final Function favoritedelete;

  const FavoriteProduct({
    Key key,
    this.id,
    this.name,
    this.image,
    this.price,
    this.favoriteadd,
    this.favoritedelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xff444444).withOpacity(0.25),
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(
                        image: NetworkImage(image),
                        width: 80,
                        height: 80,
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff444444),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                Text(
                                  '${formatter.format(price.toInt()) + ' ₸'}'
                                      .replaceAll(',', ' '),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: favoriteadd,
                            child: Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                color: Color(0xff444444),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Себетке салу',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: favoritedelete,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      size: 32,
                                      color: Color(0xff444444),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

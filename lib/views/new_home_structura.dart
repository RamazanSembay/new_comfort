import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_comfort/views/home_view.dart';
import 'package:new_comfort/views/new_airpods_structura.dart';
import 'package:new_comfort/views/new_detail_structura.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:new_comfort/views/new_laptop_structura.dart';
import 'package:new_comfort/views/new_person_structura.dart';
import 'package:new_comfort/views/new_phone_structura.dart';
import 'package:new_comfort/views/new_watch_structura.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'dart:math' as math;

class HomeStructuraTest extends StatefulWidget {
  @override
  State<HomeStructuraTest> createState() => _HomeStructuraTestState();
}

class _HomeStructuraTestState extends State<HomeStructuraTest> {
  User user = FirebaseAuth.instance.currentUser;
  DocumentSnapshot vendorData;

  @override
  void initState() {
    getVendorData();
    super.initState();
  }

  Future<DocumentSnapshot> getVendorData() async {
    var result = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .get();
    setState(() {
      vendorData = result;
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###');
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff444444),
                  borderRadius: BorderRadius.circular(10),
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
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              vendorData != null
                                  ? vendorData.data()['FullName']
                                  : '',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: vendorData != null
                                    ? Image.network(
                                        vendorData.data()['Img'],
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        height: 100,
                                        width: 100,
                                      ),
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
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                height: 220,
                width: double.infinity,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProductStructura(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: Container(
                height: 200,
                width: double.infinity,
                child: FutureBuilder<QuerySnapshot>(
                  future:
                      FirebaseFirestore.instance.collection('Реклама').get(),
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

                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data.docs[index];
                        return ProductStructuraNew(
                          name: data['Название'],
                          image: data['Картинка'],
                          price: data['Цена'],
                          oldPrice: data['Старый Цена'],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 30, bottom: 30),
              child: Container(
                width: double.infinity,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Интернет-дүкен Comfort.kz',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff444444),
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'APPLE'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff444444),
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 500,
                      width: double.infinity,
                      child: FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('Apple Телефондары')
                            .get(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          return StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            itemCount: 4,
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 15.0,
                            itemBuilder: (context, index) {
                              var data = snapshot.data.docs[index];
                              return AppleProduct(
                                name: data['Название'],
                                image: data['Картинка'],
                                price: data['Цена'],
                                onTap: () {
                                  Get.to(
                                    NewDetailStructura(
                                      id: data.id,
                                      name: data['Название'],
                                      image: data['Картинка'],
                                      brend: data['Модель'],
                                      price: data['Цена'],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  AllButton(
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'SAMSUNG'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff444444),
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 500,
                      width: double.infinity,
                      child: FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('Samsung Телефондары')
                            .get(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          return StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            itemCount: 4,
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 15.0,
                            itemBuilder: (context, index) {
                              var data = snapshot.data.docs[index];
                              return AppleProduct(
                                name: data['Название'],
                                image: data['Картинка'],
                                price: data['Цена'],
                                onTap: () {
                                  Get.to(
                                    NewDetailStructura(
                                      id: data.id,
                                      name: data['Название'],
                                      image: data['Картинка'],
                                      brend: data['Модель'],
                                      price: data['Цена'],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  AllButton(
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Сізді қызықтыруы мүмкін'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff444444),
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('Товары')
                            .get(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          return StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            itemCount: snapshot.data.docs.length,
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 15.0,
                            itemBuilder: (context, index) {
                              var data = snapshot.data.docs[index];
                              return AppleProduct(
                                name: data['Название'],
                                image: data['Картинка'],
                                price: data['Цена'],
                                onTap: () {
                                  Get.to(
                                    NewDetailStructura(
                                      id: data.id,
                                      name: data['Название'],
                                      image: data['Картинка'],
                                      brend: data['Модель'],
                                      price: data['Цена'],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  AllButton(
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AllButton extends StatelessWidget {
  final Function onTap;

  const AllButton({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        color: Color(0xff444444),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Барлығы',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Transform.rotate(
                angle: 180 * math.pi / 180,
                child: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppleProduct extends StatelessWidget {
  final String name;
  final String image;
  final int price;
  final Function onTap;

  const AppleProduct({Key key, this.name, this.image, this.price, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Color(0xff78CAEE).withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Color(0xff4A9ED5).withOpacity(0.5),
                      //     blurRadius: 10,
                      //     spreadRadius: 0,
                      //     offset: Offset(0, 0),
                      //   ),
                      // ],
                      ),
                  child: Image.network(
                    image,
                    height: 90,
                    width: 90,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  height: 75,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff444444),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${formatter.format(price.toInt()) + ' ₸'}'
                                    .replaceAll(',', ' '),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Color(0xffC4C4C4),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.navigate_next,
                                      size: 20,
                                      color: Color(0xff444444),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductStructuraNew extends StatelessWidget {
  final String name;
  final String image;
  final int price;
  final int oldPrice;

  const ProductStructuraNew({
    Key key,
    this.name,
    this.price,
    this.oldPrice,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffBFBFBF).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                // color: Colors.deepPurple[200],
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      height: double.infinity,
                      // color: Colors.deepPurpleAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff444444),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${formatter.format(price.toInt()) + ' ₸'}'
                                    .replaceAll(',', ' '),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff444444),
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '${formatter.format(oldPrice.toInt()) + ' ₸'}'
                                    .replaceAll(',', ' '),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffA5A5A5),
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 25,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xffDB3A01),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'жеңілдік',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 180,
                      height: double.infinity,
                      // color: Colors.deepOrangeAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: NetworkImage(image),
                            width: 120,
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductStructura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 0, bottom: 20),
          child: InkWell(
            onTap: () {
              Get.to(NewPhoneStructura());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  width: 125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'images/apple.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'Телефондар',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff444444),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 0, bottom: 20),
          child: InkWell(
            onTap: () {
              Get.to(NewLaptopStructura());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  width: 125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'images/macbook.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'Ноутбуктер',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff444444),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 0, bottom: 20),
          child: InkWell(
            onTap: () {
              Get.to(NewAirpodsStructura());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  width: 125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'images/airpods.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'Құлаққаптар',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff444444),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 0, bottom: 0),
          child: InkWell(
            onTap: () {
              Get.to(NewWatchStructura());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  width: 125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'images/watch.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'Сағаттар',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff444444),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Container(
                            //   height: 40,
                            //   width: 40,
                            //   child: ClipRRect(
                            //     borderRadius: BorderRadius.circular(12),
                            //     child: vendorData == null
                            //         ? Image.network(
                            //             vendorData.data()['Img'],
                            //             height: 100,
                            //             width: 100,
                            //             fit: BoxFit.fitHeight,
                            //           )
                            //         : Container(
                            //             height: 40,
                            //             width: 40,
                            //             decoration: BoxDecoration(
                            //               color: Colors.white,
                            //               borderRadius:
                            //                   BorderRadius.circular(50),
                            //             ),
                            //             child: Column(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.center,
                            //               children: [
                            //                 Icon(
                            //                   Icons.photo_camera,
                            //                   size: 15,
                            //                   color: Color(0xff444444),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //   ),
                            // ),
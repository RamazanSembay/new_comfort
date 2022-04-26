import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_comfort/help/config/size_config.dart';
import 'package:new_comfort/provider/register_provider.dart';
import 'package:new_comfort/structura/bottom.dart';
import 'package:new_comfort/views/category_test.dart';
import 'package:new_comfort/views/category_view.dart';
import 'package:new_comfort/views/detail_view.dart';
import 'package:new_comfort/views/favorite_view.dart';
import 'package:new_comfort/views/new_favorite_structura.dart';
import 'package:new_comfort/views/new_home_structura.dart';
import 'package:new_comfort/views/login_view.dart';
import 'package:new_comfort/views/new_store_structura.dart';
import 'package:new_comfort/views/new_person_structura.dart';
import 'package:new_comfort/views/new_basket_structura.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController _tabsController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: Bottom(
        selectedTab: _selectedTab,
        tabPressed: (num) {
          setState(() {
            _tabsController.animateToPage(num,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          });
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _tabsController,
              onPageChanged: (num) {
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [
                HomeStructuraTest(),
                NewStoreStructura(),
                NewFavoriteStructura(),
                NewBasketStructura(),
                NewPersonStructura(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Home
class HomeStructure extends StatefulWidget {
  @override
  State<HomeStructure> createState() => _HomeStructureState();
}

class _HomeStructureState extends State<HomeStructure> {
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

    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 70,
                  width: double.infinity,
                  // color: Colors.grey[400],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              'https://content.fortune.com/wp-content/uploads/2016/04/gettyimages-489769706.jpg',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Қош келдіңіз 👋,',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffAAAAAA),
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  FirebaseAuth.instance.signOut();
                                  Get.to(LoginView());
                                },
                                child: Text(
                                  vendorData != null
                                      ? vendorData.data()['FullName']
                                      : 'Загрузка',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff444444),
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Color(0xff8BCAC0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      // color: Colors.grey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Өзіңіздің Техникаңызды\nБізбен Бірге Табайық',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff444444),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            'Мысалы: apple, macbook',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffAAAAAA),
                                fontFamily: 'Montserrat',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                                hintText: 'Comfort.kz дүкеннен іздеу',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color(0xffAAAAAA),
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffAAAAAA),
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  // color: Colors.deepOrangeAccent,
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
                          return Product(
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Категория',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff444444),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(
                                CategoryTest(
                                  title: 'Категория',
                                  view: CategoryAll(),
                                ),
                              );
                            },
                            child: Transform.rotate(
                              angle: 180 * math.pi / 180,
                              child: Icon(
                                Icons.keyboard_backspace,
                                color: Color(0xff444444),
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 120,
                        // color: Colors.grey,
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('Категория')
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
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                var data = snapshot.data.docs[index];
                                return Category(
                                  name: data['Название'],
                                  image: data['Картинка'],
                                  onTap: () {
                                    Get.to(
                                      CategoryTest(
                                        title: data['Название'],
                                        view: CategoryDetail(
                                          id: data['Id'],
                                          name: data['Название'],
                                          image: data['Картинка'],
                                          price: data['Цена'],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  // color: Colors.grey[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Интернет-дүкен Comfort.kz',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff444444),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Apple Телефондары',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff444444),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Image(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/128/0/747.png'),
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 450,
                        // color: Colors.deepPurple[200],
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
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }

                            return StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                var data = snapshot.data.docs[index];
                                return Apple(
                                  name: data['Название'],
                                  image: data['Картинка'],
                                  price: data['Цена'],
                                  onTap: () {
                                    Get.to(
                                      DetailView(
                                        name: data['Название'],
                                        image: data['Картинка'],
                                        model: data['Модель'],
                                        price: data['Цена'],
                                        storagy: data['Место хранения'],
                                        processor: data['Процессор'],
                                        ozu: data['Озу'],
                                      ),
                                    );
                                  },
                                );
                              },
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.fit(1),
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 15.0,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Color(0xff8BCAC0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Барлық Apple Телефондары',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff444444),
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xff444444),
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Divider(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Apple Ноутбуктері',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff444444),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Image(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/128/0/747.png'),
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 450,
                        // color: Colors.deepPurple[200],
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('Apple Ноутбуктері')
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
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }

                            return StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                var data = snapshot.data.docs[index];
                                return Apple(
                                  name: data['Название'],
                                  image: data['Картинка'],
                                  price: data['Цена'],
                                  onTap: () {
                                    Get.to(
                                      DetailView(
                                        name: data['Название'],
                                        image: data['Картинка'],
                                        model: data['Модель'],
                                        price: data['Цена'],
                                        storagy: data['Место хранения'],
                                        processor: data['Процессор'],
                                        ozu: data['Озу'],
                                      ),
                                    );
                                  },
                                );
                              },
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.fit(1),
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 15.0,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Color(0xff8BCAC0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Барлық Apple Ноутбуктері',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff444444),
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xff444444),
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Divider(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Apple Құлаққаптары',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff444444),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Image(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/128/0/747.png'),
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 450,
                        // color: Colors.deepPurple[200],
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('Apple Құлаққаптары')
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
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }

                            return StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                var data = snapshot.data.docs[index];
                                return Apple(
                                  name: data['Название'],
                                  image: data['Картинка'],
                                  price: data['Цена'],
                                  onTap: () {
                                    Get.to(
                                      DetailView(
                                        name: data['Название'],
                                        image: data['Картинка'],
                                        model: data['Модель'],
                                        price: data['Цена'],
                                        storagy: data['Место хранения'],
                                        processor: data['Процессор'],
                                        ozu: data['Озу'],
                                      ),
                                    );
                                  },
                                );
                              },
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.fit(1),
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 15.0,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Color(0xff8BCAC0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Барлық Apple Құлаққаптары',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff444444),
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xff444444),
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Divider(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Samsung Телефондары',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff444444),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Image(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/128/882/882747.png'),
                            width: 40,
                            height: 40,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 450,
                        // color: Colors.deepPurple[200],
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
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }

                            return StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                var data = snapshot.data.docs[index];
                                return Apple(
                                  name: data['Название'],
                                  image: data['Картинка'],
                                  price: data['Цена'],
                                  onTap: () {
                                    Get.to(
                                      DetailView(
                                        name: data['Название'],
                                        image: data['Картинка'],
                                        model: data['Модель'],
                                        price: data['Цена'],
                                        storagy: data['Место хранения'],
                                        processor: data['Процессор'],
                                        ozu: data['Озу'],
                                      ),
                                    );
                                  },
                                );
                              },
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.fit(1),
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 15.0,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Color(0xff8BCAC0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Барлық Samsung Телефондары',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff444444),
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xff444444),
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Divider(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Oppo Телефондары',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff444444),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Image(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/882/882745.png'),
                            width: 40,
                            height: 40,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 450,
                        // color: Colors.deepPurple[200],
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('Oppo Телефондары')
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
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }

                            return StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                var data = snapshot.data.docs[index];
                                return Apple(
                                  name: data['Название'],
                                  image: data['Картинка'],
                                  price: data['Цена'],
                                  onTap: () {
                                    Get.to(
                                      DetailView(
                                        name: data['Название'],
                                        image: data['Картинка'],
                                        model: data['Модель'],
                                        price: data['Цена'],
                                        storagy: data['Место хранения'],
                                        processor: data['Процессор'],
                                        ozu: data['Озу'],
                                      ),
                                    );
                                  },
                                );
                              },
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.fit(1),
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 15.0,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Color(0xff8BCAC0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Барлық Oppo Телефондары',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff444444),
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xff444444),
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  // color: Colors.grey[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Басқада технологиялар',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff444444),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FutureBuilder<QuerySnapshot>(
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

                          return Container(
                            height: 700,
                            width: double.infinity,
                            child: StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              itemCount: snapshot.data.size,
                              itemBuilder: (context, index) {
                                var data = snapshot.data.docs[index];
                                return Apple(
                                  name: data['Название'],
                                  image: data['Картинка'],
                                  price: data['Цена'],
                                  onTap: () {
                                    Get.to(
                                      DetailView(
                                        name: data['Название'],
                                        image: data['Картинка'],
                                        model: data['Модель'],
                                        price: data['Цена'],
                                        storagy: data['Место хранения'],
                                        processor: data['Процессор'],
                                        ozu: data['Озу'],
                                      ),
                                    );
                                  },
                                );
                              },
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.fit(1),
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 15.0,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Категория',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff444444),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(CategoryView(
                                title: 'Категория',
                              ));
                            },
                            child: Transform.rotate(
                              angle: 180 * math.pi / 180,
                              child: Icon(
                                Icons.keyboard_backspace,
                                color: Color(0xff444444),
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 120,
                        // color: Colors.grey,
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('Категория')
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
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }

                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                var data = snapshot.data.docs[index];
                                return Category(
                                  name: data['Название'],
                                  image: data['Картинка'],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 150),
            ],
          ),
        ],
      ),
    );
  }
}

class Apple extends StatelessWidget {
  final String name;
  final String image;
  final int price;
  final Function onTap;

  const Apple({Key key, this.name, this.image, this.price, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: NetworkImage(image),
              width: 70,
              height: 70,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff444444),
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${formatter.format(price.toInt()) + ' ₸'}'
                      .replaceAll(',', ' '),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff444444),
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
              width: double.infinity,
              color: Color(0xff8BCAC0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Себетке салу',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff444444),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String name;
  final String image;
  final Function onTap;

  const Category({Key key, this.name, this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 140,
          width: 140,
          // color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(image),
                width: 80,
                height: 80,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff444444),
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  final String name;
  final String image;
  final int price;
  final int oldPrice;

  const Product({
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
                              fontFamily: 'Montserrat',
                            ),
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
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ],
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
                          SizedBox(height: 5),
                          Container(
                            height: 30,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color(0xff8BCAC0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Жеңілдікті көру',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff444444),
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ],
                            ),
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

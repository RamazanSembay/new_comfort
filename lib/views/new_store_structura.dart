import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_comfort/views/new_detail_structura.dart';
import 'package:new_comfort/views/new_home_structura.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'dart:math' as math;

import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class NewStoreStructura extends StatefulWidget {
  @override
  State<NewStoreStructura> createState() => _NewStoreStructuraState();
}

class _NewStoreStructuraState extends State<NewStoreStructura> {
  String query = '';
  var result;
  searchFunction(query, searchList) {
    result = searchList.where((element) {
      return element["Название"].toUpperCase().contains(query) ||
          element["Название"].toLowerCase().contains(query) ||
          element["Название"].toUpperCase().contains(query) &&
              element["Название"].toLowerCase().contains(query);
    }).toList();
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
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                child: Container(
                  height: 230,
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
                    padding: const EdgeInsets.all(25.0),
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
                                  'icon/shop.png',
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.cover,
                                  color: Color(0xff444444),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Comfort дүкені',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff444444),
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Өзіңіздің Техникаңызды\nБізбен Бірге Табайық',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff444444),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Text(
                            'Мысалы: apple, macbook',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff444444),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff444444),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  query = value;
                                });
                              },
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff999999),
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                                hintText: 'Comfort.kz дүкеннен іздеу',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color(0xff999999),
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff999999),
                                  fontFamily: 'OpenSans',
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
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance.collection('Товары').get(),
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

                    return query == ''
                        ? StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data.docs.length,
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 15.0,
                            itemBuilder: (context, index) {
                              var varData =
                                  searchFunction(query, snapshot.data.docs);

                              var data = varData[index];

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
                          )
                        : StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            scrollDirection: Axis.vertical,
                            itemCount: result.length,
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 15.0,
                            itemBuilder: (context, index) {
                              var varData =
                                  searchFunction(query, snapshot.data.docs);

                              var data = varData[index];

                              return result.isEmpty
                                  ? Text('No')
                                  : AppleProduct(
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
            ],
          ),
        ],
      ),
    );
  }
}

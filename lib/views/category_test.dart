import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:intl/intl.dart';

class CategoryTest extends StatelessWidget {
  final Future future;
  final StatelessWidget view;
  final String title;

  const CategoryTest({Key key, this.future, this.view, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              SizedBox(height: 40),
              // назад
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    // color: Colors.deepPurpleAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('images/back.png'),
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Категория text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  // color: Colors.deepOrangeAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
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
              view,
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('Категория').get(),
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

        return StaggeredGridView.countBuilder(
          shrinkWrap: true,
          crossAxisCount: 2,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            var data = snapshot.data.docs[index];
            return Container(
              height: 180,
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: NetworkImage(data['Картинка']),
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    data['Название'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff444444),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            );
          },
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
        );
      },
    );
  }
}

class CategoryDetail extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  final int price;
  final Function onTap;

  const CategoryDetail(
      {Key key, this.id, this.name, this.image, this.price, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###');
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('Категория')
            .doc(id)
            .collection('Категория')
            .get(),
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

          return StaggeredGridView.countBuilder(
            shrinkWrap: true,
            crossAxisCount: 2,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data.docs[index];
              return GestureDetector(
                onTap: onTap,
                child: Container(
                  // color: Colors.red,
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
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
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
            },
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
          );
        },
      ),
    );
  }
}

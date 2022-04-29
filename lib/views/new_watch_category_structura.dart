import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_comfort/views/new_home_structura.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'new_detail_structura.dart';

class NewWatchCategoryStructura extends StatelessWidget {
  final Future<QuerySnapshot> future;
  final String title;
  const NewWatchCategoryStructura({Key key, this.future, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff444444),
            fontFamily: 'OpenSans',
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff444444),
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: FutureBuilder<QuerySnapshot>(
          future: future,
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
              crossAxisCount: 2,
              itemCount: snapshot.data.docs.length,
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
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
    );
  }
}

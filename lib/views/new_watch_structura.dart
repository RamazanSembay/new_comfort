import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_comfort/views/new_airpods_category_structura.dart';

class NewWatchStructura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Сағаттар',
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
      backgroundColor: Color(0xffE6E9EB),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 180,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Apple',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff444444),
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(NewAirpodsCategoryStructura(
                              title: 'Apple',
                              future: FirebaseFirestore.instance
                                  .collection('Apple Сағаттар')
                                  .get(),
                            ));
                          },
                          child: Text(
                            'Барлығы',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff888888),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: WatchApple(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 180,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Samsung',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff444444),
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(NewAirpodsCategoryStructura(
                              title: 'Samsung',
                              future: FirebaseFirestore.instance
                                  .collection('Samsung Сағаттар')
                                  .get(),
                            ));
                          },
                          child: Text(
                            'Барлығы',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff888888),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SamsungWatch(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WatchApple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h85/h06/46553394708510/apple-watch-series-7-41-mm-cernyj-102582811-2.jpg'),
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h85/h06/46553394708510/apple-watch-series-7-41-mm-cernyj-102582811-2.jpg'),
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h85/h06/46553394708510/apple-watch-series-7-41-mm-cernyj-102582811-2.jpg'),
                width: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SamsungWatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h5f/h77/44807404257310/samsung-galaxy-watch-4-sm-r860-40mm-rozovyj-102120670-2.jpg'),
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h66/h21/44807408189470/samsung-galaxy-watch-4-sm-r860-40mm-cernyj-102120692-2.jpg'),
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hc0/hda/45132808814622/samsung-galaxy-watch-4-sm-r870n-44-mm-serebristyj-102192111-1.jpg'),
                width: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

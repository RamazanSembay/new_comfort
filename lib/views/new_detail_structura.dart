import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class NewDetailStructura extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final String brend;
  final int price;

  const NewDetailStructura(
      {Key key, this.name, this.image, this.brend, this.price, this.id})
      : super(key: key);
  @override
  State<NewDetailStructura> createState() => _NewDetailStructuraState();
}

class _NewDetailStructuraState extends State<NewDetailStructura> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    var formatter = NumberFormat('#,###');
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        child: InkWell(
          onTap: () {
            FirebaseFirestore.instance
                .collection('Менің себетім')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .collection('Менің себетім')
                .doc(widget.id)
                .set({
              'Id': widget.id,
              'Название': widget.name,
              'Картинка': widget.image,
              'Цена': widget.price,
              'Модель': widget.brend,
              'Количество': 1
            });
          },
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff444444),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Себетке салу'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 30),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff444444).withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  'icon/back.png',
                                  height: 35,
                                  width: 35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: GestureDetector(
                                onTap: () {
                                  FirebaseFirestore.instance
                                      .collection('Маған ұнағандар')
                                      .doc(
                                          FirebaseAuth.instance.currentUser.uid)
                                      .collection('Маған ұнағандар')
                                      .doc(widget.id)
                                      .set({
                                    'Id': widget.id,
                                    'Название': widget.name,
                                    'Картинка': widget.image,
                                    'Цена': widget.price,
                                    'Модель': widget.brend,
                                  });
                                },
                                child: Image.asset(
                                  'icon/favorite_2.png',
                                  height: 35,
                                  width: 35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.brend,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff444444),
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                              // Image.network(
                              //   'https://cdn-icons-png.flaticon.com/512/0/747.png',
                              //   height: 30,
                              //   width: 30,
                              //   fit: BoxFit.cover,
                              // ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff444444),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Container(
                            height: 140,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  widget.image,
                                  height: 120,
                                  // width: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              ],
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
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Бағасы',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff999999),
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Text(
                    '${formatter.format(widget.price.toInt()) + ' ₸'}'
                        .replaceAll(',', ' '),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff444444),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Divider(
                color: Color(0xff444444),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Сипаттамалары',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff999999),
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '- видеокарта: Apple 8 core CPU\n- диагональ экрана: 14.2 дюйм\n- разрешение экрана: 3024x1964\n- процессор: Apple M1 Pro\n- размер оперативной памяти: 16 ГБ\n- тип жесткого диска: SSD\n- общий объем накопителей: 512 ГБ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff666666),
                      fontFamily: 'OpenSans',
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

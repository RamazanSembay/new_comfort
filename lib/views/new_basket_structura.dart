import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import 'new_continue_structura.dart';

class NewBasketStructura extends StatefulWidget {
  final String id;

  const NewBasketStructura({Key key, this.id}) : super(key: key);
  @override
  State<NewBasketStructura> createState() => _NewBasketStructuraState();
}

class _NewBasketStructuraState extends State<NewBasketStructura> {
  int basket_quantity = 1;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartData();

    int totalPrice = cartProvider.subTotal();
    int quantity = cartProvider.subTotal1();

    if (cartProvider.getCartList.isEmpty) {
      setState(() {
        totalPrice = 0;
      });
    }

    var formatter = NumberFormat('#,###');

    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          cartProvider.getCartList.isEmpty
              ? Container()
              : Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 40, bottom: 30),
                      child: Container(
                        height: 200,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'icon/store_1.png',
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.cover,
                                        color: Color(0xff444444),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Менің себетім',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff444444),
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Себетте: ' + '${quantity}' ' тауар',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff444444),
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                    Text(
                                      'Барлығы: ' +
                                          '${formatter.format(totalPrice.toInt()) + ' ₸'}'
                                              .replaceAll(',', ' '),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff444444),
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    print('Continue');
                                    Get.to(NewContinueStructura(
                                      quantity: quantity,
                                      totalprice: totalPrice,
                                    ));
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Color(0xff444444),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Жалғастыру',
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          cartProvider.getCartList.isEmpty
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
                        'Себетке ешнарсе салған жоқсыз',
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
                    itemCount: cartProvider.getCartList.length,
                    itemBuilder: (context, index) {
                      var data = cartProvider.cartList[index];

                      void quantityFunction() {
                        FirebaseFirestore.instance
                            .collection('Менің себетім')
                            .doc(FirebaseAuth.instance.currentUser.uid)
                            .collection('Менің себетім')
                            .doc(data.id)
                            .update({
                          'Количество': basket_quantity,
                        });
                      }

                      return BasketProduct(
                        name: data.name,
                        image: data.image,
                        price: data.price,
                        quantity: data.quantity,
                        basketdelete: () {
                          FirebaseFirestore.instance
                              .collection('Менің себетім')
                              .doc(FirebaseAuth.instance.currentUser.uid)
                              .collection('Менің себетім')
                              .doc(data.id)
                              .delete();

                          Get.snackbar(
                            "Себет",
                            "Себеттег Өшірдім",
                            icon: Icon(Icons.delete, color: Colors.white),
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Color(0xff444444),
                            borderRadius: 5,
                            margin: EdgeInsets.all(15),
                            colorText: Colors.white,
                            duration: Duration(seconds: 3),
                            isDismissible: true,
                            dismissDirection: DismissDirection.horizontal,
                            forwardAnimationCurve: Curves.easeOutBack,
                          );
                        },
                        basketquantityadd: () {
                          setState(() {
                            basket_quantity++;
                            quantityFunction();
                            print(data.id);
                          });
                        },
                        basketquantityremove: () {
                          if (basket_quantity > 1) {
                            setState(() {
                              basket_quantity--;
                              quantityFunction();
                            });
                          }
                        },
                      );
                    },
                  ),
                ),
          // StreamBuilder<QuerySnapshot>(
          //   stream: FirebaseFirestore.instance
          //       .collection('Менің себетім')
          //       .doc(FirebaseAuth.instance.currentUser.uid)
          //       .collection('Менің себетім')
          //       .snapshots(),
          //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //     if (snapshot.hasError) {
          //       return Text('Something went wrong');
          //     }

          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 40),
          //         child: Center(child: CircularProgressIndicator()),
          //       );
          //     }

          //     return ListView.builder(
          //       physics: BouncingScrollPhysics(),
          //       scrollDirection: Axis.vertical,
          //       itemCount: snapshot.data.docs.length,
          //       itemBuilder: (context, index) {
          //         var data = snapshot.data.docs[index];

          //         void quantityFunction() {
          //           FirebaseFirestore.instance
          //               .collection('Менің себетім')
          //               .doc(FirebaseAuth.instance.currentUser.uid)
          //               .collection('Менің себетім')
          //               .doc(data.id)
          //               .update({
          //             'Количество': basket_quantity,
          //           });
          //         }

          //         return BasketProduct(
          //           name: data['Название'],
          //           image: data['Картинка'],
          //           price: data['Цена'],
          //           quantity: data['Количество'],
          //           basketdelete: () {
          //             FirebaseFirestore.instance
          //                 .collection('Менің себетім')
          //                 .doc(FirebaseAuth.instance.currentUser.uid)
          //                 .collection('Менің себетім')
          //                 .doc(data.id)
          //                 .delete();
          //           },
          //           basketquantityadd: () {
          //             setState(() {
          //               basket_quantity++;
          //               quantityFunction();
          //               print(basket_quantity);
          //             });
          //           },
          //           basketquantityremove: () {
          //             if (basket_quantity > 1) {
          //               setState(() {
          //                 basket_quantity--;
          //                 quantityFunction();
          //                 print(basket_quantity);
          //               });
          //             }
          //           },
          //         );
          //       },
          //     );
          //   },

          //   //   return snapshot.data.docs.isEmpty
          //   //       ? Center(
          //   //           child: Text(
          //   //             'Жоқ',
          //   //             style: TextStyle(
          //   //               fontSize: 15,
          //   //               fontWeight: FontWeight.w600,
          //   //               color: Color(0xff444444),
          //   //               fontFamily: 'OpenSans',
          //   //             ),
          //   //           ),
          //   //         )
          //   //       : Container(
          //   //           height: MediaQuery.of(context).size.height,
          //   //           width: double.infinity,
          //   //           child: ListView.builder(
          //   //             physics: BouncingScrollPhysics(),
          //   //             scrollDirection: Axis.vertical,
          //   //             itemCount: snapshot.data.docs.length,
          //   //             itemBuilder: (context, index) {
          //   //               var data = snapshot.data.docs[index];

          //   //               void quantityFunction() {
          //   //                 FirebaseFirestore.instance
          //   //                     .collection('Менің себетім')
          //   //                     .doc(FirebaseAuth.instance.currentUser.uid)
          //   //                     .collection('Менің себетім')
          //   //                     .doc(data.id)
          //   //                     .update({
          //   //                   'Количество': basket_quantity,
          //   //                 });
          //   //               }

          //   //               return BasketProduct(
          //   //                 name: data['Название'],
          //   //                 image: data['Картинка'],
          //   //                 price: data['Цена'],
          //   //                 quantity: data['Количество'],
          //   //                 basketdelete: () {
          //   //                   FirebaseFirestore.instance
          //   //                       .collection('Менің себетім')
          //   //                       .doc(FirebaseAuth.instance.currentUser.uid)
          //   //                       .collection('Менің себетім')
          //   //                       .doc(data.id)
          //   //                       .delete();
          //   //                 },
          //   //                 basketquantityadd: () {
          //   //                   setState(() {
          //   //                     basket_quantity++;
          //   //                     quantityFunction();
          //   //                     print(basket_quantity);
          //   //                   });
          //   //                 },
          //   //                 basketquantityremove: () {
          //   //                   if (basket_quantity > 1) {
          //   //                     setState(() {
          //   //                       basket_quantity--;
          //   //                       quantityFunction();
          //   //                       print(basket_quantity);
          //   //                     });
          //   //                   }
          //   //                 },
          //   //               );
          //   //             },
          //   //           ),
          //   //         );
          //   // },
          // ),
        ],
      ),
    );
  }
}

class BasketProduct extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final int price;
  final int quantity;

  final Function basketdelete;

  final Function basketquantityadd;
  final Function basketquantityremove;

  const BasketProduct({
    Key key,
    this.id,
    this.name,
    this.image,
    this.price,
    this.quantity,
    this.basketdelete,
    this.basketquantityadd,
    this.basketquantityremove,
  }) : super(key: key);

  @override
  State<BasketProduct> createState() => _BasketProductState();
}

class _BasketProductState extends State<BasketProduct> {
  int basket_quantity = 1;

  void quantityFunction() {
    FirebaseFirestore.instance
        .collection('Менің себетім')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Менің себетім')
        .doc(widget.id)
        .update({
      'Количество': basket_quantity,
    });
  }

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###');
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
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
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(
                        image: NetworkImage(widget.image),
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
                                  widget.name,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                Text(
                                  '${formatter.format(widget.price.toInt()) + ' ₸'}'
                                      .replaceAll(',', ' '),
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
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: widget.basketquantityremove,
                                      child: Icon(
                                        Icons.remove_circle,
                                        size: 32,
                                        color: Color(0xff444444),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        widget.quantity.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff444444),
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: widget.basketquantityadd,
                                      child: Icon(
                                        Icons.add_circle,
                                        size: 32,
                                        color: Color(0xff444444),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: widget.basketdelete,
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
                          ],
                        ),
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

// StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection('Менің себетім')
//                 .doc(FirebaseAuth.instance.currentUser.uid)
//                 .collection('Менің себетім')
//                 .snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 return Text('Something went wrong');
//               }

//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40),
//                   child: Center(child: CircularProgressIndicator()),
//                 );
//               }

//               return snapshot.data.docs.isEmpty
//                   ? Center(
//                       child: Text(
//                         'Жоқ',
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xff444444),
//                           fontFamily: 'OpenSans',
//                         ),
//                       ),
//                     )
//                   : Container(
//                       height: MediaQuery.of(context).size.height,
//                       width: double.infinity,
//                       child: ListView.builder(
//                         physics: BouncingScrollPhysics(),
//                         scrollDirection: Axis.vertical,
//                         itemCount: snapshot.data.docs.length,
//                         itemBuilder: (context, index) {
//                           var data = snapshot.data.docs[index];

//                           void quantityFunction() {
//                             FirebaseFirestore.instance
//                                 .collection('Менің себетім')
//                                 .doc(FirebaseAuth.instance.currentUser.uid)
//                                 .collection('Менің себетім')
//                                 .doc(data.id)
//                                 .update({
//                               'Количество': basket_quantity,
//                             });
//                           }

//                           return BasketProduct(
//                             name: data['Название'],
//                             image: data['Картинка'],
//                             price: data['Цена'],
//                             quantity: data['Количество'],
//                             basketdelete: () {
//                               FirebaseFirestore.instance
//                                   .collection('Менің себетім')
//                                   .doc(FirebaseAuth.instance.currentUser.uid)
//                                   .collection('Менің себетім')
//                                   .doc(data.id)
//                                   .delete();
//                             },
//                             basketquantityadd: () {
//                               setState(() {
//                                 basket_quantity++;
//                                 quantityFunction();
//                                 print(basket_quantity);
//                               });
//                             },
//                             basketquantityremove: () {
//                               if (basket_quantity > 1) {
//                                 setState(() {
//                                   basket_quantity--;
//                                   quantityFunction();
//                                   print(basket_quantity);
//                                 });
//                               }
//                             },
//                           );
//                         },
//                       ),
//                     );
//             },
//           ),

// ListView.builder(
//                           physics: BouncingScrollPhysics(),
//                           scrollDirection: Axis.vertical,
//                           itemCount: snapshot.data.docs.length,
//                           itemBuilder: (context, index) {
//                             var data = snapshot.data.docs[index];

//                             void quantityFunction() {
//                               FirebaseFirestore.instance
//                                   .collection('Менің себетім')
//                                   .doc(FirebaseAuth.instance.currentUser.uid)
//                                   .collection('Менің себетім')
//                                   .doc(data.id)
//                                   .update({
//                                 'Количество': basket_quantity,
//                               });
//                             }

//                             return BasketProduct(
//                               name: data['Название'],
//                               image: data['Картинка'],
//                               price: data['Цена'],
//                               quantity: data['Количество'],
//                               basketdelete: () {
//                                 FirebaseFirestore.instance
//                                     .collection('Менің себетім')
//                                     .doc(FirebaseAuth.instance.currentUser.uid)
//                                     .collection('Менің себетім')
//                                     .doc(data.id)
//                                     .delete();
//                               },
//                               basketquantityadd: () {
//                                 setState(() {
//                                   basket_quantity++;
//                                   quantityFunction();
//                                   print(basket_quantity);
//                                 });
//                               },
//                               basketquantityremove: () {
//                                 if (basket_quantity > 1) {
//                                   setState(() {
//                                     basket_quantity--;
//                                     quantityFunction();
//                                     print(basket_quantity);
//                                   });
//                                 }
//                               },
//                             );
//                           },
//                         )

// Column(
//                         children: [
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     left: 20, right: 20, top: 40, bottom: 30),
//                                 child: Container(
//                                   height: 200,
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(15),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color:
//                                             Color(0xff8BCAC0).withOpacity(0.5),
//                                         blurRadius: 20,
//                                         spreadRadius: 0,
//                                         offset: Offset(0, 0),
//                                       ),
//                                     ],
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(15.0),
//                                     child: Container(
//                                       height: double.infinity,
//                                       width: double.infinity,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(12),
//                                                 child: Image.asset(
//                                                   'icon/store_1.png',
//                                                   height: 20,
//                                                   width: 20,
//                                                   fit: BoxFit.cover,
//                                                   color: Color(0xff444444),
//                                                 ),
//                                               ),
//                                               SizedBox(width: 10),
//                                               Text(
//                                                 'Менің себетім',
//                                                 style: TextStyle(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Color(0xff444444),
//                                                   fontFamily: 'OpenSans',
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Себетте: ' +
//                                                     '${snapshot.data.docs.length} тауар',
//                                                 style: TextStyle(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Color(0xff444444),
//                                                   fontFamily: 'OpenSans',
//                                                 ),
//                                               ),
//                                               Text(
//                                                 'Барлығы: ' + '' + ' ₸',
//                                                 style: TextStyle(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Color(0xff444444),
//                                                   fontFamily: 'Montserrat',
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Container(
//                                             height: 50,
//                                             width: 200,
//                                             decoration: BoxDecoration(
//                                               color: Color(0xff444444),
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                             ),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Text(
//                                                   'Жалғастыру',
//                                                   style: TextStyle(
//                                                     fontSize: 15,
//                                                     fontWeight: FontWeight.w600,
//                                                     color: Colors.white,
//                                                     fontFamily: 'OpenSans',
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )

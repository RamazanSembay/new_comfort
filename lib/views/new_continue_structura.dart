import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_comfort/views/new_edit_address_structura.dart';
import 'package:new_comfort/views/new_order_success_structura.dart';
import 'package:new_comfort/views/new_person_structura.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class NewContinueStructura extends StatefulWidget {
  final int quantity;
  final int totalprice;

  const NewContinueStructura({Key key, this.quantity, this.totalprice})
      : super(key: key);

  @override
  State<NewContinueStructura> createState() => _NewContinueStructuraState();
}

class _NewContinueStructuraState extends State<NewContinueStructura> {
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

    return Scaffold(
      backgroundColor: Color(0xffE6E9EB),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 40, bottom: 30),
                child: Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Color(0xff444444),
                                  size: 24,
                                ),
                              ),
                              const Text(
                                'Менің тапсырысым',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff444444),
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(NewEditAddressStructura(
                                    city: vendorData != null
                                        ? vendorData.data()['City']
                                        : '',
                                    address: vendorData != null
                                        ? vendorData.data()['Address']
                                        : '',
                                    phone: vendorData != null
                                        ? vendorData.data()['Phone']
                                        : '',
                                  ));
                                },
                                child: const Icon(
                                  Icons.edit,
                                  size: 24,
                                  color: Color(0xff444444),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              // color: Colors.amber,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Жеткізу',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff444444),
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: double.infinity,
                                          color: Color(0xffE6E9EB),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                ),
                                                child: Icon(
                                                  Icons.location_city,
                                                  color: Color(0xff444444),
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                vendorData != null
                                                    ? vendorData
                                                        .data()['Address']
                                                    : '',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff444444),
                                                  fontFamily: 'OpenSans',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          height: 50,
                                          width: double.infinity,
                                          color: Color(0xffE6E9EB),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                ),
                                                child: Icon(
                                                  Icons.phone,
                                                  color: Color(0xff444444),
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                vendorData != null
                                                    ? vendorData.data()['Phone']
                                                    : '',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff444444),
                                                  fontFamily: 'OpenSans',
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Тапсырыстар тізімі',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 220,
                width: double.infinity,
                color: Colors.white,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: cartProvider.getCartList.length,
                  itemBuilder: (context, index) {
                    var data = cartProvider.cartList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        // color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Image(
                                  image: NetworkImage(
                                    data.image,
                                  ),
                                  width: 50,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  data.name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff444444),
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                              SizedBox(width: 80),
                              Expanded(
                                child: Text(
                                  data.quantity.toString() + 'дана',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff444444),
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Себетте: ' +
                                '${widget.quantity.toString()}' ' тауар',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff444444),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Text(
                            'Барлығы: ' +
                                '${formatter.format(widget.totalprice.toInt()) + ' ₸'}'
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
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        print('Тапсырыс беру');
                        FirebaseFirestore.instance
                            .collection('Менің себетім')
                            .doc(FirebaseAuth.instance.currentUser.uid)
                            .set({
                          "Id": FirebaseAuth.instance.currentUser.uid,
                          "FullName": vendorData != null
                              ? vendorData.data()['FullName']
                              : '',
                          "Email": vendorData != null
                              ? vendorData.data()['Email']
                              : '',
                          "Phone": vendorData != null
                              ? vendorData.data()['Phone']
                              : '',
                          "Address": vendorData != null
                              ? vendorData.data()['Address']
                              : '',
                          "City": vendorData != null
                              ? vendorData.data()['City']
                              : '',
                          "Img": vendorData != null
                              ? vendorData.data()['Img']
                              : '',
                          "TotalPrice": totalPrice,
                          "Quantity": quantity,
                          "Date": DateTime.now(),
                        });

                        Get.snackbar(
                          "Тапсырыс",
                          "Тапсырысыңыз қабылданды",
                          icon: Icon(Icons.local_shipping, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Color(0xff444444),
                          borderRadius: 5,
                          margin: EdgeInsets.all(15),
                          colorText: Colors.white,
                          duration: Duration(seconds: 3),
                          isDismissible: true,
                          dismissDirection: DismissDirection.horizontal,
                          forwardAnimationCurve: Curves.easeOutBack,
                        );
                        Get.to(NewOrderSuccessStructure());
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color(0xff444444),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Тапсырыс беру ',
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
            ],
          ),
        ),
      ),
    );
  }
}

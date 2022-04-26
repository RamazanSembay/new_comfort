import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_comfort/services/firebase_services.dart';

class NewEditAddressStructura extends StatefulWidget {
  final String city;
  final String address;
  final String phone;

  const NewEditAddressStructura({Key key, this.city, this.address, this.phone})
      : super(key: key);

  @override
  State<NewEditAddressStructura> createState() =>
      _NewEditAddressStructuraState();
}

final _cityTextController = TextEditingController();
final _addressTextController = TextEditingController();
final _phoneTextController = TextEditingController();

class _NewEditAddressStructuraState extends State<NewEditAddressStructura> {
  bool _isLoading = false;

  FirebaseServices _services = FirebaseServices();

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
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 120,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (_cityTextController.text.trim().isEmpty) {
                  Get.snackbar(
                    'Қаланы толтырыңыз',
                    'Сіз өз қалаңызды енгізбедіңіз',
                    snackPosition: SnackPosition.TOP,
                  );

                  return;
                } else {
                  if (_addressTextController.text.trim().isEmpty) {
                    Get.snackbar(
                      'Мекенжайды толтырыңыз',
                      'Сіз өз мекенжайды енгізбедіңіз',
                      snackPosition: SnackPosition.TOP,
                    );
                    return;
                  } else {
                    if (_phoneTextController.text.trim().isEmpty) {
                      Get.snackbar(
                        'Телефон нөмеріңізді толтырыңыз',
                        'Сіз өз телефон нөмеріңізді енгізбедіңіз',
                        snackPosition: SnackPosition.TOP,
                      );
                      return;
                    } else {
                      setState(() {
                        _isLoading = true;
                      });
                      setState(() {
                        _isLoading = true;
                      });
                      setState(() {
                        _isLoading = true;
                      });
                      _services.addUserData(
                        data: {
                          'City': _cityTextController.text,
                          'Address': _addressTextController.text,
                          'Phone': _phoneTextController.text,
                        },
                      );
                      Navigator.pop(context);
                      _cityTextController.text = '';
                      _addressTextController.text = '';
                      _phoneTextController.text = '';
                    }
                  }
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.edit,
                      size: 24,
                      color: Color(0xff444444),
                    ),
                  ),
                  Text(
                    'Сақтау',
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
            SizedBox(height: 35),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                _cityTextController.text = '';
                _addressTextController.text = '';
                _phoneTextController.text = '';
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Color(0xff444444),
                    ),
                  ),
                  Text(
                    'Артқа қайту',
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
          ],
        ),
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _isLoading
                ? Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff4444444),
                        ),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 40, bottom: 30),
                        child: Container(
                          height: 250,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Icon(
                                          Icons.edit,
                                          size: 24,
                                          color: Color(0xff444444),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Көшені өзгерту',
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
                                        'Қала: ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff444444),
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                      Text(
                                        widget.city,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff444444),
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Көше және үй нөмірі: ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff444444),
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                      Text(
                                        widget.address,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff444444),
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Нөмер телефон: ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff444444),
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                      Text(
                                        widget.phone,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff444444),
                                          fontFamily: 'Montserrat',
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: _cityTextController,
                              onChanged: (value) {
                                value = _cityTextController.text;
                              },
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff444444),
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                labelText: 'Қала',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: _addressTextController,
                              onChanged: (value) {
                                value = _addressTextController.text;
                              },
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff444444),
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                labelText: 'Көше және үй нөмірі',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: _phoneTextController,
                              onChanged: (value) {
                                value = _phoneTextController.text;
                              },
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff444444),
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                labelText: 'Нөмер телефон',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
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
    );
  }
}

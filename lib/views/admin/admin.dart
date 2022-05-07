import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_comfort/views/admin/new_admin_structura.dart';
import 'package:provider/provider.dart';

import '../../provider/login_provider.dart';

class Admin extends StatefulWidget {
  @override
  State<Admin> createState() => _AdminState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText = true;

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              email.text = '';
                              password.text = '';
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: Color(0xff444444),
                                  size: 24,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Артқа'.toUpperCase(),
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
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('images/icon.png'),
                                width: 20,
                                height: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Кіру'.toUpperCase(),
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
                  ],
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Админ Жүйесіне\nКіру',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff444444),
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff444444),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          controller: email,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            border: InputBorder.none,
                            hintText: 'Пошта',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff444444),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          obscureText: obserText,
                          controller: password,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                obserText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            border: InputBorder.none,
                            hintText: 'Пароль',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      if (email.text == 'Admin' || password.text == '123') {
                        Get.to(NewAdminStructura());
                      }
                      // loginProvider.loginValidation(
                      //   email: email,
                      //   password: password,
                      //   context: context,
                      // );
                    },
                    child: Container(
                      height: 68,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff444444),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Кіру'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 25,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

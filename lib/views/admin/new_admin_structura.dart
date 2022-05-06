import 'package:flutter/material.dart';

class NewAdminStructura extends StatefulWidget {
  @override
  State<NewAdminStructura> createState() => _NewAdminStructuraState();
}

class _NewAdminStructuraState extends State<NewAdminStructura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F4F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Басты бет
            Padding(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Text(
                'Басты бет',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff444444),
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Divider(
                thickness: 2,
                color: Color(0xffCCCCCC),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                'Бақылау тақтасы',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff444444),
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Color(0xffEBFDEE),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '100',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff444444),
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            Text(
                              'Тіркелгендер',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff444444),
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Color(0xffE8F0FB),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '16+',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff444444),
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            Text(
                              'Тапсырыс бергендер',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff444444),
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Тіркелгендер
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                'Тіркелгендер',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff444444),
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Divider(
                thickness: 2,
                color: Color(0xffCCCCCC),
              ),
            ),

            //
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff777777),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        // color: Colors.red,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                'https://static.onecms.io/wp-content/uploads/sites/20/2021/12/28/Elon-Musk.jpg',
                                height: 34.0,
                                width: 34.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Elon Mask',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff444444),
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            SizedBox(width: 150),
                            Text(
                              '2 May',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff777777),
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            SizedBox(width: 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Тапсырыс бергендер
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Text(
                'Тапсырыс бергендер',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff444444),
                  fontFamily: 'OpenSans',
                ),
              ),
            ),

            //
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff777777),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        // color: Colors.red,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                'https://static.onecms.io/wp-content/uploads/sites/20/2021/12/28/Elon-Musk.jpg',
                                height: 34.0,
                                width: 34.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Elon Mask',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff444444),
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            SizedBox(width: 150),
                            Text(
                              '2 May',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff777777),
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            SizedBox(width: 0),
                          ],
                        ),
                      ),
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
